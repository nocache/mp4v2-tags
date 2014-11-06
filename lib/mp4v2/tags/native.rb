module Mp4v2
  # libmp4v2 binding to call native C++ function
  module Native
    extend FFI::Library

    SET_ARGS = [:MP4Tags, :string]

    ffi_lib ['libmp4v2']

    typedef :pointer, :MP4FileHandle
    typedef :pointer, :MP4Tags

    attach_function :mp4_modify, :MP4Modify, [:string, :uint32, :uint32],
                    :MP4FileHandle
    attach_function :mp4_read, :MP4Read, [:string],
                    :MP4FileHandle
    attach_function :mp4_close, :MP4Close, [:MP4FileHandle], :void
    attach_function :mp4_tags_alloc, :MP4TagsAlloc, [], :MP4Tags
    attach_function :mp4_tags_free, :MP4TagsFree, [:MP4Tags], :void
    attach_function :mp4_tags_fetch, :MP4TagsFetch, [:MP4Tags, :MP4FileHandle],
                    :bool
    attach_function :mp4_tags_store, :MP4TagsStore, [:MP4Tags, :MP4FileHandle],
                    :bool

    attach_function :mp4_tags_set_name, :MP4TagsSetName, SET_ARGS, :bool
    attach_function :mp4_tags_set_artist, :MP4TagsSetArtist, SET_ARGS, :bool
    attach_function :mp4_tags_set_album, :MP4TagsSetAlbum, SET_ARGS, :bool
    attach_function :mp4_tags_set_grouping, :MP4TagsSetGrouping, SET_ARGS, :bool
    attach_function :mp4_tags_set_composer, :MP4TagsSetComposer, SET_ARGS, :bool
    attach_function :mp4_tags_set_comments, :MP4TagsSetComments, SET_ARGS, :bool
    attach_function :mp4_tags_set_genre, :MP4TagsSetGenre, SET_ARGS, :bool
  end
end
