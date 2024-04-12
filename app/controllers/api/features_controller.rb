class Api::FeaturesController < ApplicationController
  def index
    begin
      features_list = Feature.all.map do |feature|
        {
          "id": feature.id,
          "type": "feature",
          "attributes": {
            "external_id": feature.external_id,
            "magnitude": feature.magnitude,
            "place": feature.place,
            "time": feature.time,
            "tsunami": feature.tsunami,
            "mag_type": feature.mag_type,
            "title": feature.title,
            "coordinates": {
              "longitude": feature.longitude,
              "latitude": feature.latitude
            }
          },
          "links": {
            "external_url": feature.external_url
          }
        }
      end
      @features = {
        "data": features_list ,
        "pagination": {
          "current_page": 0,
          "total": features_list.count,
          "per_page": 10
        }
      }
      render json: @features
    rescue => e
      render json: { mensaje: 'Error al obtener los datos', error: e.message }, status: :unprocessable_entity
    end
  end

  def comments
    @comment = Comment.new(feature_id: params[:id], body: params[:body])

    if @comment.save
      render json: { message: 'Comentario guardado correctamente.' }, status: :created
    else
      render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

end
