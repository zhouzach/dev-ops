
[2021-01-04 14:31:04][qile-test-cdh004] 2021-01-04 14:31:04,509 INFO  Format - Formatting Data path for tier 0:/mnt/ramdisk/alluxioworker^M
[2021-01-04 14:31:04][qile-test-cdh004] 2021-01-04 14:31:04,513 ERROR Format - Failed to format^M
[2021-01-04 14:31:04][qile-test-cdh004] java.nio.file.NoSuchFileException: /mnt/ramdisk/alluxioworker^M
[2021-01-04 14:31:04][qile-test-cdh004] at sun.nio.fs.UnixException.translateToIOException(UnixException.java:86)^M
[2021-01-04 14:31:04][qile-test-cdh004] at sun.nio.fs.UnixException.rethrowAsIOException(UnixException.java:102)^M
[2021-01-04 14:31:04][qile-test-cdh004] at sun.nio.fs.UnixException.rethrowAsIOException(UnixException.java:107)^M
[2021-01-04 14:31:04][qile-test-cdh004] at sun.nio.fs.UnixFileSystemProvider.createDirectory(UnixFileSystemProvider.java:384)^M
[2021-01-04 14:31:04][qile-test-cdh004] at java.nio.file.Files.createDirectory(Files.java:674)^M
[2021-01-04 14:31:04][qile-test-cdh004] at alluxio.cli.Format.formatWorkerDataFolder(Format.java:66)^M
[2021-01-04 14:31:04][qile-test-cdh004] at alluxio.cli.Format.format(Format.java:136)^M
[2021-01-04 14:31:04][qile-test-cdh004] at alluxio.cli.Format.main(Format.java:97)^M


在所有节点创建/mnt/ramdisk/alluxioworker
mkdir -p /mnt/ramdisk/alluxioworker