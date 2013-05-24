LoginView = Backbone.View.extend({
  events: {
    'click #login': 'login'
  },
  login: function() {
    var username = $('#username').val();
    var password = $('#password').val();
    $.post('/login', {username: username, password: password}, function(data) {
      alert(data);
    });
  },
  render: function() {
    var template = _.template($("#login_template").html(), {});
    this.$el.html(template);
  }
});
IndexView = Backbone.View.extend({
  render: function() {
    var login = new LoginView({el: this.$el});
    login.render();
  }
});

Collaborator = Backbone.Router.extend ({
  routes: {
    "": "index"
  },

  index: function() {
    var index = new IndexView({el: '.main'})
    index.render()
  }
});