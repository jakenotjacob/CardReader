require "libusb"

usb = LIBUSB::Context.new
device = usb.devices(:idVendor => 0x0801, :idProduct => 0x0001).first

device.open_interface(0) do |handle|
	handle.control_transfer(:bmRequestType => 0x80, :bRequest => 0xa0, :wValue => 0xe600, :wIndex => 0x0000, :dataOut => 1.chr)
end

=begin
bLength => 18
bDescriptorType => 1
bcdUSB => 272
bDeviceProtocol => 0
bMaxPacketSize0 => 8
idVendor => 2049 
idProduct => 1
bcdDevice => 256
iSerialNumber => 3
bNumConfigurations => 1
=end

=begin
Bus 003 Device 010: ID 0801:0001 MagTek Mini Swipe Reader (Keyboard Emulation)
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0         8
  idVendor           0x0801 MagTek
  idProduct          0x0001 Mini Swipe Reader (Keyboard Emulation)
  bcdDevice            1.00
  iManufacturer           1 Mag-Tek
  iProduct                2 USB Swipe Reader
  iSerial                 3 °Q@`
 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           34
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      1 Keyboard
      iInterface              0 
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.00
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      76
         Report Descriptors: 
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval               1
Device Status:     0x0000
  (Bus Powered)
=end
