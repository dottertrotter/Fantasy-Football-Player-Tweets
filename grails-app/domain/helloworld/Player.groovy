package helloworld

class Player {

    static belongsTo = [team:Team]

    String name
    String pos
    String notes = ''
    Boolean watch = false

    static constraints = {
    }

}
