def login_page; @login_page ||= page(LoginPage).await end
def unit_page; @unit_page ||= page(UnitPage).await end
def lesson_page; @lesson_page ||= page(LessonPage).await end
def step_page; @step_page ||= page(StepPage).await end
def settings_page; @settings_page ||= page(SettingsPage).await end