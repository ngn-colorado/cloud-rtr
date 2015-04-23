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

##Build notes:
  * Please use make 3.81. Future Android versions, e.g. the versions used in the Iveia Android 4 release, require make 3.82 or lower explicitely. However, this version of Android does not have any warnings.
   * When using make 4 or higher, errors are thrown when building the core/build/prebuilt.mk file
   * When using make 3.82, an error is thrown with a call to free() causing the build to crash
   * make 3.81 seems to work, as per http://comments.gmane.org/gmane.comp.handhelds.android.porting/12191
