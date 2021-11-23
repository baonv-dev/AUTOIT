Run("SQLite.exe")
WinWaitActive("DB Browser for SQLite Portable | PortableApps.com Installer", "DB Browser for SQLite Portable")
Send("!n")

WinWaitActive("DB Browser for SQLite Portable | PortableApps.com Installer", "Choose Install Location")
Send("{ENTER}")

WinWaitActive("DB Browser for SQLite Portable | PortableApps.com Installer", "Completing DB Browser for SQLite Portable Setup")
Send("{ENTER}")

WinClose("DB Browser for SQLite Portable | PortableApps.com Installer")