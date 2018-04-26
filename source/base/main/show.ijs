NB. show.ijs

NB. =========================================================
NB. plotshow
plotshow=: 3 : 0
gtk_window_present_with_time_jgtk_ ((0&". ::]) PFormhwnd),GDK_CURRENT_TIME_jgtk_
selectpid''
gpinit''
make ''
gtk_show 1
)
