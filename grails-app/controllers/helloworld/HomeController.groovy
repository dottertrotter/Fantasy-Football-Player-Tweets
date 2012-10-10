package helloworld
import grails.converters.JSON

class HomeController {

    def index() {

    }

    def teams(){

        render Team.list() as JSON

    }

    def players(){

        def team = Team.get(params.id)

        render team.players as JSON

    }

    def playerTweets(){

        def query = "fantasyfootball,"

        def url = new URL("http://search.twitter.com/search.json?q="+query.encodeAsURL()+params.name.encodeAsURL())
        def response = JSON.parse(url.newReader())

        render response

    }

}
