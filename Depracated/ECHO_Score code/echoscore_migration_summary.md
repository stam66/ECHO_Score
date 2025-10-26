# ECHOScore Migration Summary
## Group Management Refactoring

### Overview
This migration moves group assignment from the **video level** to the **case level**, which is more logical since all videos in a case are always shown together.

---

## Database Changes

### 1. Run the Migration Script
Execute `echoscore_db_migration_groups` to add the new column:

```sql
ALTER TABLE cases 
ADD COLUMN case_groups TEXT NULL;

ALTER TABLE cases 
ADD INDEX idx_case_groups (case_groups(100));
```

### 2. Database Structure
- ✅ **cases.case_groups** (TEXT) - Stores comma-separated group names
- ✅ **case_videos.video_purpose** (TEXT) - **RETAINED** for potential future use
- Format: `"Cardiology 2025 Q1,ICU 2025 Q1,ED 2025 Q1"`

---

## Updated Artifacts

### Core Components Updated:

1. **echoscore_db_migration_groups** (NEW)
   - SQL script to add case_groups column
   - Includes index for performance

2. **echoscore_wc_casedetails_groups** (UPDATED)
   - Tag-based group selection UI
   - PopupMenu + Add/Remove buttons
   - Visual list of assigned groups
   - Saves to cases.case_groups

3. **echoscore_wc_caselist_complete** (UPDATED)
   - Filters by cases.case_groups instead of video_purpose
   - Shows case groups in listbox

4. **echoscore_wc_userhome** (UPDATED)
   - Filters by cases.case_groups
   - Students see cases matching their user_group

5. **echoscore_dlg_addcase_complete** (UPDATED)
   - Saves initial group to cases.case_groups
   - Can be expanded later in wc_CaseDetails

6. **echoscore_wc_casereview_part1** (UPDATED)
   - Simplified - no per-video filtering
   - Shows all videos in a case

---

## Tag-Based Group Selection UI

### Layout
```
┌─────────────────────────────────────┐
│ Assigned Groups                     │
├─────────────────────────────────────┤
│ Select a group and click Add.       │
│ Students in any assigned group will │
│ see this case.                       │
├─────────────────────────────────────┤
│ [Select group... ▼] [Add Group]     │
├─────────────────────────────────────┤
│ Currently Assigned:                  │
│ ┌─────────────────────────────────┐ │
│ │ Cardiology 2025 Q1              │ │
│ │ ICU 2025 Q1                     │ │
│ │ ED 2025 Q1                      │ │
│ └─────────────────────────────────┘ │
│ [Remove Selected]                    │
└─────────────────────────────────────┘
```

### Workflow
1. Admin selects group from PopupMenu
2. Clicks "Add Group"
3. Group appears in "Currently Assigned" list
4. Can select and remove groups
5. Clicks "Save All Changes"
6. Groups saved as comma-separated string

---

## How Filtering Works

### Admin View (wc_CaseList)
- Filter by group shows cases with matching case_groups
- Uses FIND_IN_SET() and LIKE for comma-separated matching

### Student View (wc_UserHome)
- Students see cases where:
  - `case_groups` is NULL or empty (visible to all)
  - OR their `user_group` matches any value in `case_groups`

### Example:
```
User: John (user_group: "Cardiology 2025 Q1")

Cases visible to John:
✅ Case 1: case_groups = "Cardiology 2025 Q1"
✅ Case 2: case_groups = "Cardiology 2025 Q1,ICU 2025 Q1"
✅ Case 3: case_groups = NULL (visible to all)
❌ Case 4: case_groups = "ICU 2025 Q1" (not his group)
```

---

## Benefits of This Approach

### Before (Video-Level Grouping)
- ❌ Groups assigned per video
- ❌ Confusing - all videos shown together anyway
- ❌ Required filtering logic in multiple places
- ❌ Could have inconsistent groups within same case

### After (Case-Level Grouping)
- ✅ Groups assigned to entire case
- ✅ Logical - matches how content is consumed
- ✅ Simpler filtering logic
- ✅ Consistent group assignment
- ✅ Tag-based UI for easy multi-group assignment

---

## Migration Steps

### 1. Database
```bash
# Run the migration script
mysql -u root -p echoscore < migration.sql
```

### 2. Verify Schema
```sql
DESCRIBE cases;
-- Should see case_groups column (TEXT, NULL)
```

### 3. Update Code
Replace these artifacts in your Xojo project:
- wc_CaseDetails → echoscore_wc_casedetails_groups
- wc_CaseList → echoscore_wc_caselist_complete
- wc_UserHome → (already updated)
- dlg_AddCase → echoscore_dlg_addcase_complete
- wc_CaseReview (Part 1) → (already updated)

### 4. Test Workflow
1. Create new case with group assignment
2. Open case details and add/remove groups
3. Upload videos (no group assignment needed)
4. Filter cases by group in admin view
5. Login as student and verify filtering

---

## Backwards Compatibility

### Existing Data
- Old `video_purpose` data is retained but not used for filtering
- Can be repurposed for other features (e.g., "Advanced", "Beginner")

### Existing Cases
- Cases without `case_groups` are visible to all users
- Can be updated through wc_CaseDetails UI

---

## Future Enhancements

### Possible Uses for video_purpose:
- Skill level markers ("Beginner", "Advanced")
- Video type tags ("Parasternal", "Apical", "Subcostal")
- Quality indicators ("High Quality", "Teaching Example")

### Group Management:
- Bulk assign groups to multiple cases
- Group templates for common cohorts
- Historical group tracking

---

## Rollback Plan

If needed, you can rollback:

```sql
-- Remove the new column
ALTER TABLE cases DROP COLUMN case_groups;

-- Drop the index
ALTER TABLE cases DROP INDEX idx_case_groups;

-- Restore old code from backups
```

---

## Summary

✅ **Database:** case_groups column added to cases table  
✅ **UI:** Tag-based group selection in wc_CaseDetails  
✅ **Filtering:** Cases filtered by case_groups, not video_purpose  
✅ **Logic:** Simpler, more maintainable code  
✅ **UX:** Easier multi-group assignment for admins  
✅ **Compatibility:** video_purpose retained for future use  

**Result:** More intuitive group management that matches how the application actually works!
