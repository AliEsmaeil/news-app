
sealed class NewsAppStates{}

class NewsAppInitialState extends NewsAppStates{}
class NavigationBarState extends NewsAppStates{}
class ThemeModeChangedState extends NewsAppStates{}


class LoadingState extends NewsAppStates{}
class GotDataState extends NewsAppStates{}
class SearchCompleteState extends NewsAppStates{}
class ResetCurrentIndexState extends NewsAppStates{}

