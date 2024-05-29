

class ApiGetter {
    cls;
    id;

    constructor(cls, id){
        this.cls = cls;
        this.id = id;
    }

    get(){
        return this.cls.get(this.id);
    }
}

