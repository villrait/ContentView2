protocol SettingsButtonSupportable: AnyObject {
    func setupSettingButton()
}

protocol SettingsPresentable: AnyObject {
    func openSettings()
    func dismissSettings()
}
