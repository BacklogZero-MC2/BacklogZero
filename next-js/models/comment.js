

class Comment {
    static _baseUrl = "/comments/";
    static get(id){}

    id;
    parent_comment;
    author;
    text;
    created_timestamp;

    constructor(id, parent_comment_id, author_id, text, created_timestamp){
        this.id = id;
        this.parent_comment = ApiGetter(Comment, parent_comment_id);
        this.author = ApiGetter(User, author_id);
        this.text = text;
        this.created_timestamp = created_timestamp;
    }
}

