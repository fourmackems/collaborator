
Group = Backbone.Model.extend({
});

Groups = Backbone.Collection.extend({
	model: Group,
	url: '/groups'
});

LoginView = Backbone.View.extend({
	events: {
		'click #login': 'login'
	},
	login: function() {
		var username = ($('#username').val());
		var password = ($('#password').val());
		$.post('/login', {username: username, password: password}, function(data) {
			if(data['logged_in'] == true) {
				collaborator.navigate("groups", {trigger: true});
			} else {
				alert('Bugger off');
			}
	    });
	},
	render: function() {
	  var template = _.template($("#login_template").html(), {});
	  this.$el.html(template);
	}
});

SignupView = Backbone.View.extend({
	render: function() {
		var template = _.template($("#signup_template").html(), {});
		this.$el.append(template);
	}
});

GroupsView = Backbone.View.extend({
	initialize: function() {
		this.listenTo(this.collection, 'sync', this.render);
	},

	render: function() {
		var template = _.template($("#groups_template").html(), {});
		this.$el.html(template);
		this.collection.forEach(this.renderGroup);
	},

	renderGroup: function(group) {
		console.log(group.cid);
		var source = $("#group_template").html();
		var template = Handlebars.compile(source);
		var context = group.toJSON();
		context['cid'] = group.cid;
		$("#group-list").append(template(context));
	}
});

IndexView = Backbone.View.extend({
	render: function() {
	  var login = new LoginView({el: this.$el});
	  login.render();
	  var signup = new SignupView({el: this.$el});
	  signup.render();
	}
});

Collaborator = Backbone.Router.extend({
  initialize: function() {
  	this.groups = new Groups;
  },
  routes: {
   "": "index",
   "groups": "groups",
   "groups/:id": "group"
  },

  index: function() {
	var index = new IndexView({el: '.main'});
	index.render()
  },

  groups: function() {
  	var listOfGroups =  new GroupsView({el: '.main', collection: this.groups});
  	this.groups.fetch();
  },

  group: function(id) {
  	var group = this.groups.get(id);
  }
});