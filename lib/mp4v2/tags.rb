require 'ffi'
require 'mp4v2/tags/version'
require 'mp4v2/tags/native'
require 'mp4v2/tags/native/mp4_tags'

module Mp4v2
  # libmp4v2 binding
  module Tags
    def self.fetch_mp4_tags(filename)
      mp4_handle = Mp4v2::Native.mp4_read filename
      tags = Mp4v2::Native::MP4Tags.new(Mp4v2::Native.mp4_tags_alloc)
      Mp4v2::Native.mp4_tags_fetch(tags.pointer, mp4_handle)
      mp4_tag_to_hash(tags)
    ensure
      Mp4v2::Native.mp4_tags_free(tags.pointer) if tags
      Mp4v2::Native.mp4_close mp4_handle if mp4_handle
      nil
    end

    def self.store_mp4_tags(filename, hash)
      mp4_handle = Mp4v2::Native.mp4_modify filename, 0, 0
      tags = hash_to_mp4_tag(hash)
      Mp4v2::Native.mp4_tags_store(tags.pointer, mp4_handle)
    ensure
      Mp4v2::Native.mp4_tags_free(tags.pointer) if tags
      Mp4v2::Native.mp4_close mp4_handle if mp4_handle
    end

    private

    def self.mp4_tag_to_hash(mp4_tags)
      result_tags = {}
      Mp4v2::Native::MP4Tags.keys.each do |key|
        result_tags[key] = mp4_tags[key]
      end
      result_tags
    end

    def self.hash_to_mp4_tag(hash)
      tags = Mp4v2::Native::MP4Tags.new(Mp4v2::Native.mp4_tags_alloc)
      Mp4v2::Native::MP4Tags.keys.each do |key|
        if hash[key]
          Mp4v2::Native.send("mp4_tags_set_#{key}", tags.pointer, hash[key])
        end
      end
      tags
    end
  end
end
