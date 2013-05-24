
Post = Backbone.Model.extend({});

Posts = Backbone.Collection.extend({
	model: Post,
	url: function() {
		return "/groups/" + this.groupUrl;
	},

	groupUrl: function(url) {
		this.groupUrl = url;
	}
});

Group = Backbone.Model.extend({
	preparePosts: function() {
		var posts = new Posts;
		posts.groupUrl = this.get('url');
		this.set('posts', posts);
	}
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
		var source = $("#group_template").html();
		var template = Handlebars.compile(source);
		var context = group.toJSON();
		context['cid'] = group.cid;
		$("#group-list").append(template(context));
	}
});

PostView = Backbone.View.extend({
  render: function() {
  	var source = $("#post_template").html();
	var template = Handlebars.compile(source);
	var context = this.model.toJSON();
	$("#post-list").append(template(context));
  }
});

GroupTimelineView = Backbone.View.extend({

  events: {
  	"click #post-button": 'notReady',
  	"click .delete-button": 'notReady'
  },
  render: function() {
  	var posts = this.model.get('posts');

  	var source = $("#group_page_template").html();
	var template = Handlebars.compile(source);
	this.$el.html(template(this.model.toJSON()));
	
	this.listenTo(posts, 'sync', this.renderPosts);
	posts.fetch();
  },
  renderPosts: function() {
  	this.model.get('posts').forEach(this.renderPost);
  },
  renderPost: function(post) {
  	var postView = new PostView({el: '#post-list', model: post});
  	postView.render();
  },
  notReady: function() {
  	alert('not ready yet');
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
  	group.preparePosts();
  	var groupTimelineView = new GroupTimelineView({el: '.main', model: group});
  	groupTimelineView.render();
  }
});