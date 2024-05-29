

class Quiz {
    static _baseUrl = "/quizzes/";
    static get(id){}

    id;
    author;
    tag;
    root_dummy_comment;
    title;
    description;
    created_timestamp;
    last_updated_timestamp;

    constructor(
        id,
        author_id,
        tag_id,
        root_dummy_comment_id,
        title,
        description,
        created_timestamp,
        last_updated_timestamp
    ){
        this.id = id;
        this.author = ApiGetter(User, author_id);
        this.tag = ApiGetter(Tag, tag_id);
        this.root_dummy_comment = ApiGetter(Comment, root_dummy_comment_id);
        this.title = title;
        this.description = description;
        this.created_timestamp = created_timestamp;
        this.last_updated_timestamp = last_updated_timestamp;
    }
}

