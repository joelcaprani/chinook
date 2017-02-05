### Active Record Query Interface Assignment

### Provide one or more Active Record queries that retrieve the requested data
### below each of the following questions:


# 1a) Find the genre with the name "Hip Hop/Rap".
  Genre.where("name = ?", 'Hip Hop/Rap')
  Genre.where(name: 'Hip Hop/Rap')

# SELECT "genres".* FROM "genres" WHERE (name = 'Hip Hop/Rap')



# 1b) Count how many tracks belong to the "Hip Hop/Rap" genre
Track.where("genre_id = ?", 17).count
#    (3.1ms)  SELECT COUNT(*) FROM "tracks" WHERE (genre_id = 17)
# 35



# 2) Find the total amount of time required to listen to all the tracks in the database.
Track.sum(:milliseconds)
#    (3.3ms)  SELECT SUM("tracks"."milliseconds") FROM "tracks"
# 1378575827



# 3a) Find the highest price of any track that has the media type "MPEG audio file".

Track.where('media_type_id = ?', 1).maximum(:unit_price)
   #(5.3ms)  SELECT MAX("tracks"."unit_price") FROM "tracks" WHERE (media_type_id = 1)
#0.99


# 3b) Find the name of the most expensive track that has the media type "MPEG audio file".

Track.select(:name).where('media_type_id = ? and unit_price = ?', 1, 0.99)
  #Track Load (7.1ms)  SELECT "tracks"."name" FROM "tracks" WHERE (media_type_id = 1 and unit_price = 0.99)
###Track.where(media_type_id: (MediaType.select("id").where(name: 'MPEG audio file'))).order(unit_price: :desc).first.name


# 4) Find the 2 oldest artists.

Artist.order(:created_at).limit(2);
#   Artist Load (2.0ms)  SELECT  "artists".* FROM "artists" ORDER BY "artists"."created_at" ASC LIMIT $1  [["LIMIT", 2]]
# [
#     [0] #<Artist:0x007faa23b80068> {
#                 :id => 258,
#               :name => "Les Arts Florissants & William Christie",
#         :created_at => Fri, 13 Feb 2004 06:08:36 UTC +00:00,
#         :updated_at => Wed, 29 Jan 2014 22:10:22 UTC +00:00
#     },
#     [1] #<Artist:0x007faa23b7bd60> {
#                 :id => 31,
#               :name => "Baby Consuelo",
#         :created_at => Mon, 16 Feb 2004 22:04:39 UTC +00:00,
#         :updated_at => Wed, 29 Jan 2014 22:10:22 UTC +00:00
#     }


### Stretch Exercise (Active Record Query Interface)


# 1) Find all the albums whose titles start with B.

Album.where('title ilike ?', 'b%')
