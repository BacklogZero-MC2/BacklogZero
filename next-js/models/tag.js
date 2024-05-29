

class Tag {
    static _baseUrl = "/tags/";
    static get(id){}

    id;
    author;
    name;
    created_timestamp;

    constructor(id, author_id, name, created_timestamp) {
        this.id = id;
        this.author = ApiGetter(User, author_id);
        this.name = name;
        this.created_timestamp = created_timestamp;
    }
}

