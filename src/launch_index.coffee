

#launch login page ------------------------------------------------------------------------------------------------------------    
launch_index = ( main = document.body ) ->
    MAIN_DIV = main
    main.style.overflowY = "auto"
    main.style.overflowX = "auto"
    
    index_view = new IndexView main
