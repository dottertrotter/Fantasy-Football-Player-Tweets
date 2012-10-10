package helloworld

class Team {

    static hasMany = [players:Player]

    String name

    static mapping = {
        sort 'name'
        players sort:'name',
        lazy:true
    }

    static constraints = {
    }
}
