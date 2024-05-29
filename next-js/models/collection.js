

class Collection {
    static _baseUrl = "/collections/";
    static get(id){}

    id;
    name;
    user;
    created_timestamp;

    constructor(id, name, user_id, created_timestamp){
        this.id = id;
        this.name = name;
        this.user = ApiGetter(User, user_id);
        this.created_timestamp = created_timestamp;
    }
}

