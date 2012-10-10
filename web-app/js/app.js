// CREATE APP

var App = Em.Application.create({
    name:'Fantasy Football App'
});

// MODELS

App.Team = Ember.Object.extend({
    name: null,
    id:null
});

App.Player = Ember.Object.extend({
    name:null,
    pos:null,
    id:null
});

App.Tweet = Ember.Object.extend({
    text:null,
    from_user:null
});

// CONTROLLERS

App.TeamsController = Em.ArrayController.create({
    content: [],
    loadTeams:function(){
        var me = this;

        $.getJSON('/helloworld/home/teams', function(data) {
            data.forEach(function(item){
                me.pushObject(App.Team.create({name:item.name,id:item.id}));
            });
        });
    }
});

App.PlayersController = Em.ArrayController.create({
    content: [],
    loadPlayers:function(teamId){

        var me = this;
        me.set('content',[]);
        App.TweetsController.set('content',[]);
        App.TweetsController.set('noTweetsMessage','');

        $.getJSON('/helloworld/home/players?id='+teamId, function(data) {
            data.forEach(function(item){
                me.pushObject(App.Player.create({name:item.name,id:item.id,pos:item.pos}));
            });
        });

    }
});

App.TweetsController = Em.ArrayController.create({
    content: [],
    searchTerm:null,
    noTweetsMessage:'',
    loadTweets:(function(){

        var me = this;
        me.set('content',[]);
        me.set('noTweetsMessage','Loading...');

        $.getJSON('/helloworld/home/playerTweets?name='+this.get('searchTerm'), function(data) {
            console.log(data)
            if(data.results.length == 0){
                me.set('noTweetsMessage','No Tweets About This Player.  He\'s probably on Doug\'s team');
            }

            var results = data.results;

            results.forEach(function(item){
                me.pushObject(App.Tweet.create({text:item.text,from_user:item.from_user}));
            });
        });

    }).observes('searchTerm')
});

// PAGE CONTROLLER

App.mainController = Ember.Object.create({
    init: function(){
        App.TeamsController.loadTeams();
    }
});

// VIEWS

App.TeamView = Ember.View.extend({
    content:null,
    click: function() {
        App.PlayersController.loadPlayers(this.getPath('content.id').toString());
    }
});

App.PlayersView = Ember.View.extend({
    content:null,
    click: function() {
        App.TweetsController.set('searchTerm',this.getPath('content.name'));
    }
});

// HELPERS

Handlebars.registerHelper('listItem', function(property){
    var value = Ember.getPath(this,property);
    return new Handlebars.SafeString('<li>'+value+'</li>');
});