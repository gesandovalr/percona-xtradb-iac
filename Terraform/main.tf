## Vsphere Connection Parameters

provider "vsphere" {
  user                 = "${var.VSPHERE_USER}"
  password             = "${var.VSPHERE_PASSWORD}"
  vsphere_server       = "${var.VSPHERE_SERVER}"
  allow_unverified_ssl = true
}

## Define Datacenter Name

data "vsphere_datacenter" "dc" {
  name = "${var.DC_NAME}"
}

## Define DataStore

data "vsphere_datastore" "datastore"  {
  name          = "${var.VSPHERE_DATASTORE}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

## Define Vsphere Cluster

data "vsphere_compute_cluster" "cluster" {
  name          = "${var.VSPHERE_CLUSTER}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

## Define Vsphere Network

data "vsphere_network" "network" {
  name          = "${var.VSPHERE_NETWORK}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

## Define VM Template

data "vsphere_virtual_machine" "template" {
  name          = "${var.VM_TEMPLATE}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

## Virtual Machine Resource
resource "vsphere_virtual_machine" "server" {

  for_each         = "${var.VMS}"
  name             = each.value.name
  folder           = "${var.VM_FOLDER}"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  
## Define Bios Boot Firmware Type  
  firmware = "${var.FIRMWARE_TYPE}"

## Define Guest ID operating System
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

## Define CPU Number
  num_cpus = "${var.CPU_NUMBER}"
  cpu_hot_add_enabled    = true
  cpu_hot_remove_enabled = true
## For future releases not implemented yet  dns_suffix_list = [var.dns_search]
## Define Memory Size Guest
  memory   = "${var.MEMORY_SIZE}"
  memory_hot_add_enabled = true

## Define Network Interface Type
  network_interface {
  adapter_type = "${var.VSPHERE_NETWORK_INTERFACE_TYPE}"
  network_id   = "${data.vsphere_network.network.id}"
  }

## Define Disk Bus Type
  scsi_type        = "${data.vsphere_virtual_machine.template.scsi_type}"

## Define Disk Label
  disk {
  label            = "disk0"
  size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
  }

## Define Template Cloning option
  clone {
  template_uuid = "${data.vsphere_virtual_machine.template.id}"
  customize {
    linux_options {
      host_name = "${lower(each.value.name)}"
      domain = "mexsolutionsit.local"
      }
    network_interface {
        ipv4_address = each.value.ipv4_add_nic
        ipv4_netmask = "${var.SUBNET}"
        }
        ipv4_gateway = "${var.GATEWAY}"
        dns_server_list = "${var.NAMESERVERS}"
## For future releases not implemented yet  dns_suffix_list = [var.dns_search]
        }
    }
}