## Define Connection to Vsphere

variable "VSPHERE_USER" {
  description  = "Defines the Vsphere User"
  type         = string
  default      = "myuser"
}

variable "VSPHERE_PASSWORD" {
  description  = "Defines the Vsphere Password"
  type         = string
  default      = "mypassword"
}

variable "VSPHERE_SERVER" {
  description  = "Defines the Vcenter Server"
  type         = string 
  default      = "myserver"
}

## Define DataCenter

variable "DC_NAME" {
  description  = "Defines the Data Center name"
  type         = string
  default      = "mydc"

}

## Define Cluster

variable "VSPHERE_CLUSTER" {
  description  = "Defines the Vsphere Cluster"
  type         = string
  default      = "mycluster"
}

variable "VM_FOLDER" {
  description  = "Defines where the VM is going to be stored"
  default      = "vm/Dev-IaC"
  type         = string
}

## Define DataStore

variable "VSPHERE_DATASTORE" {
  description  = "Defines the Data Store"
  type         = string
  default      = "mydatastore"
}

## Define Network

variable "VSPHERE_NETWORK" {
  description  = "Defines the VM Network"
  type         = string
  default      = "mynetwork"
}

## Define Network interface Type

variable "VSPHERE_NETWORK_INTERFACE_TYPE" {
  description  = "Defines the VM Network Interface Type"
  type         = string
  default      = "vmxnet3"
}

## Define VM Template

variable "VM_TEMPLATE" {
  description  = "Defines the VM Template"
  type         = string
  default      = "mytemplate"
}

## Define VM Name
variable "VM_NAME" {
  description  = "Defines the VM Name"
  default      = "myvm"
  type         = string
}

## Define VM CPU
variable "CPU_NUMBER" {
  description  = "Defines CPU NUmber"
  type         = number
  default      = 4
}

## Define VM Memory Size
variable "MEMORY_SIZE" {
  description  = "Defines Memory Size"
  type         = number
  default      = 1024*8

}

## Defines Boot Type
variable "FIRMWARE_TYPE" {
  description  = "Defines Boot Type"
  type         = string
  default      = "efi"
}

## Define VM Subnet
variable "SUBNET" {
    type = string
    default = "24"
}

## Define VM Gateway
variable "GATEWAY" {
    type = string
    default = "blah"
}

## Define VM Nameserver
variable "NAMESERVERS" {
    type = list
    default = ["blah","blah"]
}

## Define Count interation not used
#variable "COUNT"{
#    type = number
#    default = 1
#}

# Count iteration
variable "VMS" {
    type = map
    default = {
      MYNODE01 = {
        name         = "MYNODE01"
        ipv4_add_nic = "blah"    
    },
      MYNODE02 = {
        name         = "MYNODE02"
        ipv4_add_nic = "blah"        
    },
      MYNODE03 = {
        name         = "MYNODE03"
        ipv4_add_nic = "blah"        
    },
  }
}
