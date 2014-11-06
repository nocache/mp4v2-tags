# Mp4v2 binding module
module Mp4v2
  module Native
    # Mp4v2 Tag struct
    class MP4Tags < FFI::Struct
      layout :__handle, :pointer,
             :name, :string,
             :artist, :string,
             :album_artist, :string,
             :album, :string,
             :grouping, :string,
             :composer, :string,
             :comments, :string,
             :genre, :string

      def self.keys
        [
          :name, :artist, :album_artist, :album,
          :grouping, :composer, :comments, :genre
        ]
      end
    end
  end
end
