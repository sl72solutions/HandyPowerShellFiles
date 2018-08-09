
# ===============================
#
# Tool designed to create a CSV data list of records from JohnsHouse table from a specified site
#
# ===============================

###################### VARIABLES #####################################

function Write-Log{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]

        [String]$Message,
        [String]$LogPath = "$env:userprofile\desktop\$(Get-Date -Format ddMMyyyy).log",
        [ValidateSet("Error", "Warning", "Information")]
        [String]$Type = "Information" 
    )
    Begin{
        $OldVerbosePreference = $VerbosePreference
        $VerbosePreference = 'Continue'
    }
    Process{
        if(!(Test-Path $LogPath)){
            Write-Verbose "Creating $LogPath."
            $NewLogFile = New-Item $LogPath -Force -ItemType File -ErrorVariable x -ErrorAction SilentlyContinue
               
            if($x){
                Write-Verbose "Failed to create log file: $x"
            }          
        }
          
        $FormattedDate = Get-Date -Format "dd-MM-yyyy HH:mm:ss"
        switch($Type){
            'Error'{
                    Write-Host "ERROR: $Message"
                    $TypeText = 'ERROR: '
            }
            'Warning'{
                    Write-Host "WARNING: $Message"
                    $TypeText = 'WARNING:'
            }
            'Information'{
                    Write-Host "INFO: $Message"
                    $TypeText = 'INFO: '
            }
        }
        "[$FormattedDate][$CurrentToolVersion][$env:Username] $TypeText $Message" | Out-File -FilePath $LogPath -Append -ErrorAction SilentlyContinue
    }
    End{
        $VerbosePreference = $OldVerbosePreference
    }
}

<#
$DBInfo_click =  { 

# database Interaction

$SQLServer = "YourServerName" #use Server\Instance for named SQL instances!
$SQLDBName = "YourDBName"
$SQLQuery = "SELECT Artist, Title, Label  from JohnsHouse order by Records asc"
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "Server = $SQLServer; Database = $SQLDBName;User ID= YourUserID; Password= YourPassword" 
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = 'StoredProcName'
$SqlCmd.Connection = $SqlConnection 
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd 
$DataSet = New-Object System.Data.DataSet
$SqlAdapter.Fill($DataSet) 

$VinylArray = @()
ForEach ($Item in $($DataSet.Tables[0])) {
    $ItemArray+="$(Item.artist) + $(Item.title) + $(Item.label)"

    # progress bar added

   # $progress = [math]::Round(
}

$SqlConnection.Close() 

#End :database Intraction
clear      #>


$DB = Import-Csv -Path  (Get-ChildItem -Path .............\PS_read_files -Filter 'puters*' ).FullName


foreach ($File in $DB)
 {

 $First = $File.xxxxx

 
 
 }




###################### CREATING PS GUI TOOL #############################
 
#### Form settings #################################################################
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  
 
    $Form = New-Object System.Windows.Forms.Form
    $Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
    $Form.Text = "SL72sSolutionssss.com"   
    $Form.Size = New-Object System.Drawing.Size(1010,400)  
    $Form.StartPosition = "CenterScreen" #loads the window in the center of the screen
    $Form.BackgroundImageLayout = "Zoom"
    $Form.MinimizeBox = $True
    $Form.MaximizeBox = $True
    $Form.WindowState = "Normal"
    $Form.SizeGripStyle = "Hide"
    $Icon = [system.drawing.icon]::ExtractAssociatedIcon($PSHOME + "\powershell.exe")
    $Form.Icon = $Icon
 
    #### Title - Powershell GUI Tool ###################################################
    $Label = New-Object System.Windows.Forms.Label
    $LabelFont = New-Object System.Drawing.Font("Calibri",18,[System.Drawing.FontStyle]::Bold)
    $Label.Font = $LabelFont
    $Label.Text = "Powershell GUI Tool"
    $Label.AutoSize = $True
    $Label.Location = New-Object System.Drawing.Size(415,40) 
    $Form.Controls.Add($Label)
 
    #### Input window with "PC Name" label ##########################################
    $InputBox = New-Object System.Windows.Forms.TextBox 
    $InputBox.Location = New-Object System.Drawing.Size(10,50) 
    $InputBox.Size = New-Object System.Drawing.Size(180,20) 
    $Form.Controls.Add($InputBox)
    write-log " and the puter name is:- $InputBox " -InformationAction SilentlyContinue
    $Label2 = New-Object System.Windows.Forms.Label
    $Label2.Text = "'Puter:"
    $Label2.AutoSize = $True
    $Label2.Location = New-Object System.Drawing.Size(15,30) 
    $Form.Controls.Add($Label2)

   

 
###################### BUTTONS ##########################################################
 
    #### Group boxes for buttons ########################################################
    $groupBox = New-Object System.Windows.Forms.GroupBox
    $groupBox.Location = New-Object System.Drawing.Size(10,95) 
    $groupBox.size = New-Object System.Drawing.Size(180,270)
    $groupBox.text = "DC Health checks:"
    $Form.Controls.Add($groupBox) 
 
    #### DB Info Button #################################################################
    $DBInfo = New-Object System.Windows.Forms.Button
    $DBInfo.Location = New-Object System.Drawing.Size(15,30)
    $DBInfo.Size = New-Object System.Drawing.Size(150,60)
    $DBInfo.Text = "DB Info"
    $DBInfo.Add_Click($DBInfo_click)    #  go to OSInfo_click and do stuff..
    $DBInfo.Cursor = [System.Windows.Forms.Cursors]::Hand
    $groupBox.Controls.Add($DBInfo)
 
    #### Certificates ###################################################################
    $Certificate = New-Object System.Windows.Forms.Button
    $Certificate.Location = New-Object System.Drawing.Size(15,110)
    $Certificate.Size = New-Object System.Drawing.Size(150,60)
    $Certificate.Text = "Certificates"
    $Certificate.Add_Click({Certificates})
    $Certificate.Cursor = [System.Windows.Forms.Cursors]::Hand
    $groupBox.Controls.Add($Certificate)
 
    #### AD Information #################################################################
    $ADInfo = New-Object System.Windows.Forms.Button
    $ADInfo.Location = New-Object System.Drawing.Size(15,190)
    $ADInfo.Size = New-Object System.Drawing.Size(150,60)
    $ADInfo.Text = "AD Info"
    $ADInfo.Add_Click({ADInfo})
    $ADInfo.Cursor = [System.Windows.Forms.Cursors]::Hand
    $groupBox.Controls.Add($ADInfo)
 
###################### END BUTTONS ######################################################
 
    #### Output Box Field ###############################################################
    $outputBox = New-Object System.Windows.Forms.RichTextBox
    $outputBox.Location = New-Object System.Drawing.Size(200,100) 
    $outputBox.Size = New-Object System.Drawing.Size(780,765)
    $outputBox.Font = New-Object System.Drawing.Font("Consolas", 8 ,[System.Drawing.FontStyle]::Regular)
    $outputBox.MultiLine = $True
    $outputBox.ScrollBars = "Vertical"
    $outputBox.Text = " `
          Welcome to your first Powershell GUI Tool - Type Domain Controller name and press one of the available buttons."
    $Form.Controls.Add($outputBox)
 
    ###################  EXECUTION      ###########################
 
    $shell = New-Object -ComObject "Shell.Application"
    $shell.minimizeall()
    $Form.Add_Shown({$Form.Activate()})
    [void] $Form.ShowDialog()