
# Data that drives the create step picker registration for this plugin.
my %runSelenium = (
    label       => "Selenium - Test",
    procedure   => "runSelenium",
    description => "Integrates Selenium Test server into CloudBees CD",
    category    => "Test"
);

$batch->deleteProperty("/server/ec_customEditors/pickerStep/Selenium");
$batch->deleteProperty("/server/ec_customEditors/pickerStep/Selenium - Test");

@::createStepPickerSteps = (\%runSelenium);