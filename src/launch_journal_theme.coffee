

#launch login page ------------------------------------------------------------------------------------------------------------    
launch_journal_theme = ( main = document.body ) ->
    MAIN_DIV = main
    main.style.overflowY = "auto"
    main.style.overflowX = "auto"
    
    index_view = new JournalView main
