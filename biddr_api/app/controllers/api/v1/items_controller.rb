class Api::V1::ItemsController < Api::ApplicationController


    before_action :authenticate_user!, except: [:index, :show]

    def index
        items = Item.order(created_at: :desc)
        render(json: items, each_serializer: ItemCollectionSerializer)
        # we will provide 'each_serializer' named argument to the option hash of the render method that tells which serializer to use with each instance
    end

    def show
        item = Item.find(params[:id])
        # return a single item in json format
        render(json: item)
    end

    def create
        item = Item.new(item_params)
        # item.user = User.first #hard code the user for now
        item.user = current_user
        if item.save!
            #.save! will throw an error if ythe item model is invalid
            render json: { id: item.id }
        else
            render(
                json: { errors: item.errors.messages },
                status: 422 #unprocessable entity HTTP status code
            )
        end

        # item.save!
        # render json: { id: item.id }
    end

    def destroy
        item = Item.find(params[:id])
        # based on the id of the user request, delete that item
        if item.destroy
            # head :ok
            render( json: {status: 200 })
        else
            #head :bad_request
            render( json: {status: 500 })
        end
    end

    private

    def item_params
        params.require(:item).permit(:title, :description, :reserve_price)
    end








end
