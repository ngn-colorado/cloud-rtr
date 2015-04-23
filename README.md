# xilinx-android-manifest
This is the manifest for my forked version of the Xilinx-sponsored Android OS developed by Iveia. Since they have
shut down their repositories for the port of gingerbread to the zc702 and the current port of Android that Iveia
has created does not boot, I have pushed the locally cloned versions of Android that I had before.

I need a version of Android that boots on the Zedboard, but since Iveia has deleted it for whatever reason, I must
put it here. It may prove useful to others as well.

For reference, the link to the old manifest git repository is: git://git.iveia.com/scm/xilinx/android/platform/manifest.git

Instructions for building this version of Android for the Zedboard are available at: http://elinux.org/Zedboard_Android
Just replace the Iveia git URLs with URLs from these repositories, mainly the manifest repository URL. Everything else should work unmodified.

Some repos are taken from the AOSP:
  * https://android.googlesource.com/platform/prebuilt.git - `gingerbread-release` - Due to GitHub's file size limitations  and the fact that Xilinx/Iveia do not make any modifications, this version tracks the branch: `gingerbread-release`. 
    * Note that the Iveia repository head was at tag: `android-2.3.6_r0.9`. However, the Google `repo` tool is unable to clone from this tag as a revision.
