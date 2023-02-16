# Integrated version

This plugin was developed and tested against Selenium Remote Control
version 1.0.3.

# Plugin procedures

For all parameter descriptions below, required parameters are shown in
bold italics.

## Run Selenium

Parameters `Browser`, `Start URL`, `Suite File` and `Result File` make
use of the command-line option `-htmlSuite` this been defined in one
simple line, separating the parameters by spaces. This is the reason why
they all have specified in the table below that make use of the
`htmlSuite` command-line option

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">Parameter</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;"><p>Java installation path</p></td>
<td style="text-align: left;"><p>Provide the path where <code>java.exe</code> is
installed. Default value is <code>java</code>, which assumes it is loaded in the
system path. (Required)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Selenium installation path</p></td>
<td style="text-align: left;"><p>Provide the path where Selenium is
installed. If no value is provided <code>selenium-server.jar</code> is
used.(Required)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>Browser</p></td>
<td style="text-align: left;"><p>Indicate the web browser to use.(This
is the command-line <code>-htmlSuite</code> option)(Required)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Start URL</p></td>
<td style="text-align: left;"><p>Provide the URL to apply the tests
to.(This is the command-line <code>-htmlSuite</code> option)(Required)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>Suite file</p></td>
<td style="text-align: left;"><p>Provide the absolute path to the file
that contains the suite tests.(This is the command-line <code>-htmlSuite</code>
option)(Required)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Result file</p></td>
<td style="text-align: left;"><p>Name the file where results will be
saved. Do not indicate a path for the <code>resultfile</code>. The results can be found in the  
<b>Selenium Test Results</b> link on the <b>Links</b> section of the <b>Job
Details</b>.(This is the command-line <code>-htmlSuite</code>
option)(Required)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>Log file</p></td>
<td style="text-align: left;"><p>Provide a name for the log file. (This
is the command-line <code>-log</code> option)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Port</p></td>
<td style="text-align: left;"><p>Indicate the port to use, default is
<code>4444</code>. (This is the command-line <code>-port</code>> option)</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>Timeout</p></td>
<td style="text-align: left;"><p>Indicate the number of seconds before
giving up on a process. (This is the command-line <code>-timeout</code>
option)</p></td>
</tr>
<tr class="even">
<td style="text-align: left;"><p>Additional parameters</p></td>
<td style="text-align: left;"><p>Provide any additional commands for
Selenium, written as if they were typed in the console.</p></td>
</tr>
<tr class="odd">
<td style="text-align: left;"><p>Working Directory</p></td>
<td style="text-align: left;"><p>Indicate the desired working directory.
Leave blank to use the default workspace.</p></td>
</tr>
</tbody>
</table>

### Parameter form

![screenshot](htdocs/images/selenium-1.png)

### Log file

![screenshot](htdocs/images/selenium-2.png)

### HTML output report

![screenshot](htdocs/images/selenium-3.png)

# Release notes

## EC-Selenium 2.0.9

-   The documentation has been migrated to the main site.

## EC-Selenium 2.0.8

- Renaming to "CloudBees CD/RO".

## EC-Selenium 2.0.7

-   Renaming to "CloudBees"

## EC-Selenium 2.0.5

-   Renamed ElectricCommander to ElectricFlow.

## EC-Selenium 2.0.4

-   Procedure name(s) were changed in the step picker section

## EC-Selenium 2.0.3

-   Fixed workspace issue.

## EC-Selenium 2.0.2

-   Improves to the help page document.

## EC-Selenium 2.0.1

-   New XML panel parameters implementation.

-   New help page format.
