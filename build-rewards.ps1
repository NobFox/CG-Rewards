#Load rewards txt file for lines
$lines = Get-Content "rewards.txt"

$INSnumber = 0

#Create the XML file with nice formatting
$xmlWriter = New-Object System.XMl.XmlTextWriter('rewards.xml', [System.Text.Encoding]::UTF8)
$xmlWriter.Formatting = 'Indented'
$xmlWriter.Indentation = 1
$XmlWriter.IndentChar = "`t"

# Write the XML declaration (<?xml version="1.0" encoding="utf-8"?>)
$xmlWriter.WriteStartDocument()

#Create the basic Macromaker file structure
$xmlWriter.WriteStartElement('MACROMAKER')
$XmlWriter.WriteAttributeString('ID', '1003')
    $xmlWriter.WriteStartElement('MACROS')
        $xmlWriter.WriteStartElement('MACRO')
        $XmlWriter.WriteAttributeString('Name', 'Deal Rewards')
                    $xmlWriter.WriteElementString('repeat','1')
                    $xmlWriter.WriteElementString('id','4')
                    $xmlWriter.WriteStartElement('COMMANDS')
                        #Move cursor over chat box
                        $xmlWriter.WriteStartElement("INS$INSnumber")
                            $xmlWriter.WriteElementString('id','4114')
                            $xmlWriter.WriteElementString('IsAB','1')
                            $xmlWriter.WriteElementString('XABCoord','500')
                            $xmlWriter.WriteElementString('XRELCoord','0')
                            $xmlWriter.WriteElementString('XRELLOCCoord','0')
                            $xmlWriter.WriteElementString('YABCoord','61000')
                            $xmlWriter.WriteElementString('YRELCoord','0')
                            $xmlWriter.WriteElementString('YRELLOCCoord','0')
                        $xmlWriter.WriteEndElement()     
                    $INSnumber ++
                        $xmlWriter.WriteStartElement("INS$INSnumber")
                            $xmlWriter.WriteElementString('id','4108')
                        $xmlWriter.WriteEndElement()
                    $INSnumber ++
                        $xmlWriter.WriteStartElement("INS$INSnumber")
                            $xmlWriter.WriteElementString('id','4109')
                        $xmlWriter.WriteEndElement()
                    # Loop through rewards lines adding in a delay of 100ms and hit enter
                    $lines | ForEach-Object { 
                    
                    $INSnumber ++
                        $xmlWriter.WriteStartElement("INS$INSnumber")
                            $xmlWriter.WriteElementString('id','4116')
                            $xmlWriter.WriteElementString('keys',$_)
                        $xmlWriter.WriteEndElement()
                    $INSnumber ++
                        $xmlWriter.WriteStartElement("INS$INSnumber")
                            $xmlWriter.WriteElementString('id','13')
                            $xmlWriter.WriteElementString('KeyPressed','0')
                        $xmlWriter.WriteEndElement()
                    $INSnumber ++
                        $xmlWriter.WriteStartElement("INS$INSnumber")
                            $xmlWriter.WriteElementString('id','13')
                            $xmlWriter.WriteElementString('KeyPressed','2')
                        $xmlWriter.WriteEndElement()
                    $INSnumber ++
                        $xmlWriter.WriteStartElement("INS$INSnumber")
                            $xmlWriter.WriteElementString('id','4096')
                            $xmlWriter.WriteElementString('DelayInterval','100')
                        $xmlWriter.WriteEndElement()
                    }
                    $xmlWriter.WriteEndElement()
    $xmlWriter.WriteEndElement()

#Close xml element
$xmlWriter.WriteEndElement()


#Close the file
$xmlWriter.Flush()
$xmlWriter.Close()