

class User {
    static _baseUrl = "/users/";
    static get(id){}

    id;
    username;
    email;
    password;
    created_timestamp;

    constructor(id, username, email, password, created_timestamp) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.created_timestamp = created_timestamp;
    }
}

