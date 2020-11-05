#Random SCP Generator
#Seth Wagner
#10/18/2019

#Run this command before running this script: Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted

#Import Modules

Import-Module Microsoft.Powershell.Management

#Main function that runs the script and calls other functions based on the selected series

function main{

UserInput

    if($Series -eq 'Series 1'){

       $SCP = Get-Random -Minimum 2 -Maximum 999

       SCPPage -SCP $SCP

       exit
    }
   
    elseif($Series -eq 'Series 2'){
       
       $SCP = Get-Random -Minimum 1000 -Maximum 1999

       SCPPage -SCP $SCP

       exit

    }
   
    elseif($Series -eq 'Series 3'){

       $SCP = Get-Random -Minimum 2000 -Maximum 2999

       SCPPage -SCP $SCP
       
       exit

    }
   
    elseif($Series -eq 'Series 4'){

       $SCP = Get-Random -Minimum 3000 -Maximum 3999

       SCPPage -SCP $SCP

       exit
    }
   
    elseif($Series -eq 'Series 5'){

       $SCP = Get-Random -Minimum 4000 -Maximum 4999

       SCPPage -SCP $SCP

       exit

    }
}

#Function that displays a window asking which SCP Series the user would like to generate an SCP from.

function UserInput{

     #Adds the neccessary assembly for th gui window

     Add-Type -AssemblyName System.Windows.Forms
     Add-Type -AssemblyName System.Drawing
     
     #Sets up the initial form screen

     $form = New-Object System.Windows.Forms.Form
     $form.Text = 'Random SCP Generator'
     $form.Size = New-Object System.Drawing.Size(300,200)
     $form.StartPosition = 'CenterScreen'

     #Adds the Ok Button

     $OKButton = New-Object System.Windows.Forms.Button
     $OKButton.Location = New-Object System.Drawing.Point(75,120)
     $OKButton.Size = New-Object System.Drawing.Size(75,23)
     $OKButton.Text = 'OK'
     $OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
     $form.AcceptButton = $OKButton
     $form.Controls.Add($OKButton)

     #Adds the Cancel Button

     $CancelButton = New-Object System.Windows.Forms.Button
     $CancelButton.Location = New-Object System.Drawing.Point(150,120)
     $CancelButton.Size = New-Object System.Drawing.Size(75,23)
     $CancelButton.Text = 'Cancel'
     $CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
     $form.CancelButton = $CancelButton
     $form.Controls.Add($CancelButton)

     #Label for the option menu
     
     $methodlabel = New-Object System.Windows.Forms.Label
     $methodlabel.Location = New-Object System.Drawing.Point(10,20)
     $methodlabel.Size = New-Object System.Drawing.Size(280,20)
     $methodlabel.Text = 'SCP Series:'
     $form.Controls.Add($methodlabel)

     #Option menu where user selects which series to generate from

     $listBox = New-Object System.Windows.Forms.ListBox
     $listBox.Location = New-Object System.Drawing.Point(10,40)
     $listBox.Size = New-Object System.Drawing.Size(260,20)
     $listBox.Height = 80

     #Option menu selections

     [void] $listBox.Items.Add('Series 1')
     [void] $listBox.Items.Add('Series 2')
     [void] $listBox.Items.Add('Series 3')
     [void] $listBox.Items.Add('Series 4')
     [void] $listBox.Items.Add('Series 5')

     #Options for showing the 

     $form.Controls.Add($listBox)
     $form.Topmost = $true

     #Collects which button (OK, Cancel) the user chooses.

     $result = $form.ShowDialog()

     #If user clicks OK, set variables to the provided inputs, else, generate an error

     if ($result -eq [System.Windows.Forms.DialogResult]::OK){
            
         if([String]$listbox.SelectedItem -ne ""){

                 $script:Series = $listBox.SelectedItem

          }
     
     }
         
         else{

         Write-Error 'Please select a series to generate from!'

         exit
            
         }

}

#Function that opens the webpage of the randomly generated SCP

function SCPPage{
    param($SCP)

    [System.Diagnostics.Process]::Start("http://www.scp-wiki.net/scp-$SCP")

}

main