<!doctype html>
        <!--[if lt IE 7 ]> <html lang="en" class="ie6"> <![endif]--> <!--[if IE 7 ]>    <html lang="en" class="ie7"> <![endif]--> <!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]--> <!--[if IE 9 ]>    <html lang="en" class="ie9"> <![endif]-->
        <!--[if (gt IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title></title>
    <meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/style.css?v=2">

    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>

<div class="design-container">

    <script type="text/x-handlebars">

    <h1>{{App.name}}</h1>
    <div class="container">



            <!--LIST OF TEAMS -->

            <ul class="main-list">
                <li><h2>Teams</h2></li>
                {{#each App.TeamsController}}

                <li>
                {{#view App.TeamView contentBinding="this"}}
                    <a href='#'>{{name}}</a>
                {{/view}}
                </li>

                {{/each}}
            </ul>

            <!--LIST OF TEAM PLAYERS -->

            <ul class="main-list">
                <li><h2>Players</h2></li>
                {{#each App.PlayersController}}
                <li>
                {{#view App.PlayersView contentBinding="this"}}
                    <a href='#'>{{name}} - {{pos}}</a>
                {{/view}}
                </li>
                {{/each}}
            </ul>

            <!--PLAYER INFO -->

            <ul class="main-list">
                <li><h2>Tweets</h2></li>
                {{#if App.TweetsController.length}}
                    {{#each App.TweetsController}}
                    <li>

                        {{from_user}} says: {{text}}

                    </li>
                    {{/each}}
                {{else}}
                    {{#bind App.TweetsController.noTweetsMessage}}{{listItem this}}{{/bind}}
                {{/if}}
            </ul>

            <div style="clear:left;"></div>


    </div>

    </script>

</div>

<!-- The missing protocol means that it will match the current protocol, either http or https. If running locally, we use the local jQuery. -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.2.min.js"><\/script>')</script>
<script src="js/libs/handlebars-1.0.0.beta.6.js"></script>
<script src="js/libs/ember-1.0.pre.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>
