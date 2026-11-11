# Preserved KiCad history

I preserved my nested KiCad Git repository in this [Git bundle](kicad-local-history.bundle). Its local path is `electro/main/.history/`. I left the local metadata untouched and ignored it in the outer repository to avoid an unusable embedded-repository link. My original [manufacturing ZIP](../../electro/main/main.zip) also contains copies of the saved `.history` schematic and PCB.

I exported the bundle with `git bundle create ... --all --reflog`. It includes the `master` branch, KiCad save tags and additional reflog objects. A separate verification clone contained **630 commit, 576 tree and 576 blob objects**, matching the source database. There were 588 commits reachable through the original refs and 630 with reflog history. All commit trees contain only `main.kicad_sch` and/or `main.kicad_pcb`; all blob contents were checked as KiCad data. No firmware was recovered.

To inspect without touching the working hardware files, run from the project root:

```powershell
git clone docs/evidence/kicad-local-history.bundle ../analogsim-kicad-history
git -C ../analogsim-kicad-history log --all --reverse --oneline
git -C ../analogsim-kicad-history show 48caf2d:main.kicad_sch
```

The original reflogs themselves are not transported by a bundle. Their extra commit objects are present but not all are reachable from refs. Inspecting them does not require rewriting the source history.

The [electronics reference](../electronics-reference.md#design-saves) cites selected commit IDs. The audit inspected 398 schematic-changing states in ref-reachable history and exported representative netlists with KiCad 10. Current schematic connectivity was compared with the local-history tip and the ZIP copy; physical pad nets were independently read from the current PCB.

Commit timestamps span **29 August 2026, 00:03:15 to 31 August 2026, 00:12:22**, recorded with UTC+02:00 offsets. They date design saves, not fabrication or experiments. Autosave messages provide no reliable explanation of why a change was made. Intermediate snapshots include incomplete circuits; historical component values are not operating recommendations.
