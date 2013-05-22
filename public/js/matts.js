/* ==== MATTS FOR LIST OF GROUPS ==== */

  function add_group() {
    $('#create-group-form').slideDown();
    $('#create-group-button').addClass("btn-info");
    $('#create-group-button').html("Submit");
    $('#create-group-button').unbind('click');
    $('#create-group-button').on('click',submit_group);
    }

  function submit_group() {
    $('#create-group-form').slideUp();
    $('#create-group-button').html("Add another group?");
    $('#create-group-button').unbind('click');
    $('#create-group-button').on('click',add_group);
    }

  $('#create-group-button').on('click',add_group);


  function like() {
    $(this).addClass("btn-warning");
    $(this).html("Unlike");
    $(this).unbind('click');
    $(this).on('click',unlike);
  }

  function unlike() {
    $(this).removeClass("btn-warning");
    $(this).addClass("btn-success");
    $(this).html("Like");
    $(this).unbind('click');
    $(this).on('click',like);
  }

  $('[id^=like]').on('click',like);


  /* <form method="POST" action="/groups">
          <input type="text" name="add_group" placeholder="choose a group name" />
          <span id="create-button" class="btn btn-primary">Create</span>
        </form>


<form method="POST" action="/groups">
          <input type="text" name="add_group" placeholder="choose a group name" />
          <span class="btn btn-primary">Create</span>
        </form> */



