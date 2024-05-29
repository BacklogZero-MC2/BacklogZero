

class Document {
    static _baseUrl = "/documents/";
    static get(id){}

    id;
    author;
    tag;
    root_dummy_comment;
    title;
    searchable_text;
    url;
    num_of_upvotes;
    num_of_downvotes;
    created_timestamp;
    last_updated_timestamp;
    popularity;

    constructor(
        id,
        author_id,
        tag_id,
        root_dummy_comment_id,
        title,
        searchable_text,
        url,
        num_of_upvotes,
        num_of_downvotes,
        created_timestamp,
        last_updated_timestamp,
        popularity
    ){
        this.id = id;
        this.author = ApiGetter(User, author_id);
        this.tag = ApiGetter(Tag, tag_id);
        this.root_dummy_comment = ApiGetter(Comment, root_dummy_comment_id);
        this.title = title;
        this.searchable_text = searchable_text;
        this.url = url;
        this.num_of_upvotes = num_of_upvotes;
        this.num_of_downvotes = num_of_downvotes;
        this.created_timestamp = created_timestamp;
        this.last_updated_timestamp = last_updated_timestamp;
        this.popularity = popularity;
    }
}

