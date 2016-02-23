local Array = require("lockbox.util.array")
local Stream = require("lockbox.util.stream")
local CFBMode = require("lockbox.cipher.mode.cfb")
local AES256Cipher = require("lockbox.cipher.aes256")
local ZeroPadding = require("lockbox.padding.zero")

local key = Array.fromHex("603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4")
local iv = Array.fromHex("000102030405060708090a0b0c0d0e0f")
local plaintext = Array.fromHex("6bc1bee22e409f96e93d7e117393172a")

local cipher = CFBMode.Cipher().setKey(key).setBlockCipher(AES256Cipher).setPadding(ZeroPadding)
local cipherOutput = cipher.init().update(Stream.fromArray(iv)).update(Stream.fromArray(plaintext)).finish().asHex()

local decipher = CFBMode.Decipher().setKey(key).setBlockCipher(AES256Cipher).setPadding(ZeroPadding)
local plainOutput = decipher.init().update(Stream.fromArray(iv)).update(Stream.fromHex(cipherOutput)).finish().asHex()

print(Array.toString(plaintext), Array.toString(Array.fromHex(plainOutput)))
