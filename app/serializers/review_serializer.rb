class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :score, :album_id
end
