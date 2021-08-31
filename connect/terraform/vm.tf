data "vsphere_datacenter" "Tarrytown" {
  name  = "Tarrytown"
}

data "vsphere_datastore" "tar-ds" {
    name = "tar-ds"
    datacenter_id = data.vsphere_datacenter.dc.id
  
}

resource "vsphere_content_library" "library" {
    name = "Content library"
    storage_backing = data.vsphere_datacenter.dc.guest_id
    description =  "Tarrytown content library"
}

resource "vsphere_virtual_machine" "vm" {
  name      = "terraform-test"
  num_cpus  = 2
  memory    = 2048
  guest_id = "centos" 
}
