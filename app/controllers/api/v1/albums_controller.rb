module Api
  module V1
    class AlbumsController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        albums = Album.all

        render json: AlbumSerializer.new(albums, options).serialized_json
      end

      def show
        album = Album.find_by(slug: params[:slug])

        render json: AlbumSerializer.new(album, options).serialized_json
      end

      def create
        album = Album.new(album_params)
        
        if album.save
          render json: AlbumSerializer.new(album).serialized_json
        else
          render json: { error: album.errors.messages }, status: 422          
        end
      end

      def update
        album = Album.find_by(slug: params[:slug])
        
        if album.update(album_params)
          render json: AlbumSerializer.new(album, options).serialized_json
        else
          render json: { error: album.errors.messages }, status: 422          
        end
      end
      
      def destroy
        album = Album.find_by(slug: params[:slug])
        
        if album.destroy
          head :no_content
        else
          render json: { error: album.errors.messages }, status: 422          
        end
      end 

      private

      def album_params
        params.require(:album).permit(:name, :image_url)
      end

      def options
        @options ||= { include: %i[reviews] } 
      end      
    end
  end
end