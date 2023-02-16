use ElectricCommander;
use warnings;
use strict; 
$|=1;


  #######################################################################
  # trim - deletes blank spaces before and after the entered value in 
  # the argument
  #
  # Arguments:
  #   -untrimmedString: string that will be trimmed
  #
  # Returns:
  #   trimmed string
  #
  ########################################################################  
  sub trim($) {
   
      my ($untrimmedString) = @_;
      
      my $string = $untrimmedString;
      
      #removes leading spaces
      $string =~ s/^\s+//;
      
      #removes trailing spaces
      $string =~ s/\s+$//;
      
      #returns trimmed string
      return $string;
  }


# -------------------------------------------------------------------------
# Variables
# -------------------------------------------------------------------------
my $ec = new ElectricCommander();
  $ec->abortOnError(0);
  
$::gJavaPath = trim($ec->getProperty("/myCall/javapath")-> findvalue("//value")->value());
$::gInstallPath = trim($ec->getProperty("/myCall/installpath")-> findvalue("//value")->value());
$::gPort = trim($ec->getProperty("/myCall/port")-> findvalue("//value")->value());
$::gTimeout = trim($ec->getProperty("/myCall/timeout")-> findvalue("//value")->value());
$::gLogFile = trim($ec->getProperty("/myCall/logfile")-> findvalue("//value")->value());
$::gBrowser = trim($ec->getProperty("/myCall/browser")-> findvalue("//value")->value());
$::gStartURL = trim($ec->getProperty("/myCall/starturl")-> findvalue("//value")->value());
$::gSuiteFile = trim($ec->getProperty("/myCall/suitefile")-> findvalue("//value")->value());
$::gResultFile = trim($ec->getProperty("/myCall/resultfile")-> findvalue("//value")->value());
$::gAdditionalCommands = trim($ec->getProperty("/myCall/additionalcommands")-> findvalue("//value")->value());


########################################################################
# main - contains the whole process to be done by the plugin, it builds 
#        the command line, sets the properties and the working directory
#
# Arguments:
#   -none
#
# Returns:
#   -nothing
#
########################################################################
sub main() {
    
    # create args array
    my @args = ();
    
    #properties' map
    my %props;
    
    #add path to exec if entered
    my $javaPath = '';
    
    if($::gJavaPath && $::gJavaPath ne '' && $::gJavaPath ne 'java'){
        $javaPath = '"'. $::gJavaPath. '"';
    }else{
        $javaPath = 'java';
    }  
    
    push(@args, $javaPath);
    
    push(@args, '-jar');  
    
    #add path to exec if entered
    my $executable = '';
    
    if($::gInstallPath && $::gInstallPath ne ''){
        $executable = '"' . $::gInstallPath . '"';
    }else{
        $executable = 'selenium-server.jar';
    }
        
    push(@args, $executable);
    
    if($::gAdditionalCommands  && $::gAdditionalCommands  ne '') {
        foreach my $command (split(' +', $::gAdditionalCommands)) {
	    	push(@args, "$command");
		}
    }

    if($::gPort && $::gPort ne '') {
        push(@args, '-port ' . $::gPort);
    }

    if($::gTimeout && $::gTimeout ne '') {
        push(@args, '-timeout ' . $::gTimeout);
    }    

    if($::gLogFile && $::gLogFile ne '') {
        push(@args, '-log "' . $::gLogFile . '"');
    }
    
    push(@args, '-htmlSuite "' .'*'. $::gBrowser . '" "' . $::gStartURL . '" "' . $::gSuiteFile . '" "' . $::gResultFile . '"');

    #generate the command to execute in console
    $props{'commandLine'} = createCommandLine(\@args);
    registerReports();
    
    setProperties(\%props);
    
}

########################################################################
# createCommandLine - creates the command line for the invocation
# of the program to be executed.
#
# Arguments:
#   -arr: array containing the command name and the arguments entered by 
#         the user in the UI
#
# Returns:
#   -the command line to be executed by the plugin
#
########################################################################
sub createCommandLine($) {

  	my ($arr) = @_;

    my $commandName = @$arr[0];

    my $command = $commandName;

    shift(@$arr);

	foreach my $elem (@$arr) {
        $command .= " $elem";
    }

    return $command;
    
}

########################################################################
# setProperties - set a group of properties into the Electric Commander
#
# Arguments:
#   -propHash: hash containing the ID and the value of the properties 
#              to be written into the Electric Commander
#
# Returns:
#   -nothing
#
########################################################################
sub setProperties($) {

    my ($propHash) = @_;

    # get an EC object
    my $ec = new ElectricCommander();
    $ec->abortOnError(0);

    foreach my $key (keys % $propHash) {
        my $val = $propHash->{$key};
        $ec->setProperty("/myCall/$key", $val);
    }
}

########################################################################
# registerReports - creates a link for registering the generated report
# in the job step detail
#
# Arguments:
#   -none
#
# Returns:
#   -nothing
#
########################################################################
sub registerReports(){
 
    # get an EC object
    my $ec = new ElectricCommander();
    $ec->abortOnError(0);
 
    $ec->setProperty("/myJob/artifactsDirectory", "");
    
    my $fileName = '';
    my $fileIndex = rindex($::gResultFile, '/');
    
    if($fileIndex == -1){
     
       $fileIndex = (rindex($::gResultFile, '\\'));
     
    }
    
    if($fileIndex == -1){
     
       $fileName = $::gResultFile;
     
    }else{
     
       $fileName = substr($::gResultFile, $fileIndex+1, length($::gResultFile)-$fileIndex);
     
    }
    
    $ec->setProperty("/myJob/report-urls/Selenium Test Results", 
          "jobSteps/$[jobStepId]/" . $fileName);

}

main();
