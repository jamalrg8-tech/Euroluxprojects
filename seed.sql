-- ============================================================================
-- Eurolux Project & Procurement Management System — seed data
-- Reference lists per BRD section 9 + legacy 'LIST OPTIONS' tab, plus all
-- projects imported from 'Installation status' and 'Install complete'.
-- Run AFTER supabase_setup.sql. Safe to re-run (uses ON CONFLICT DO NOTHING).
-- ============================================================================

insert into public.categories (name, sort_order) values
  ('Doors', 1),
  ('Windows', 2),
  ('Facades & Partitions', 3),
  ('Glass', 4),
  ('Film', 5),
  ('SSF Film', 6),
  ('Tinted Film', 7),
  ('Frosted Film', 8),
  ('Insect Screens', 9),
  ('Railings & Other', 10)
on conflict (name) do nothing;

insert into public.units_of_measure (name, sort_order) values
  ('Pcs', 0),
  ('Set', 1),
  ('Sqm', 2),
  ('Lm', 3),
  ('Box', 4),
  ('Roll', 5),
  ('Lot', 6)
on conflict (name) do nothing;

insert into public.suppliers (name) values
  ('ABS'),
  ('BES'),
  ('Bettio'),
  ('Decomaster'),
  ('EFP'),
  ('Emirates Glass'),
  ('Freedom'),
  ('GMI'),
  ('Origin'),
  ('Oryx'),
  ('Proal'),
  ('RENSON'),
  ('Safelite'),
  ('Schuco'),
  ('Sejel'),
  ('Select'),
  ('Shaoki'),
  ('Thiral'),
  ('Vetromax'),
  ('WA'),
  ('White Aluminium')
on conflict (name) do nothing;

insert into public.contractors (name) values
  ('BUILD STUDIO'),
  ('Build Studio'),
  ('Coco Nate Design Services'),
  ('GTS'),
  ('Giovanni'),
  ('JCT Contracting'),
  ('LCI Fitout'),
  ('MACS'),
  ('Mr. Roscoe'),
  ('Nikki Farmer'),
  ('Sirius Invest'),
  ('ZINTERIO Tech Works LLC')
on conflict (name) do nothing;

insert into public.projects (ref, site_name, main_contractor, scope_text, project_value, install_date, finish_date, status, notes, design_signoff_date, order_date, requested_delivery_date, primary_supplier, lpo_ref, work_order_no) values
  ('P-0001', 'Cluster 25, V10', 'GTS', '10 CW
3 hinge door SP - Frames installed.
9 VS-28" - Panels balance.
ORIGIN 10x OW70 top Hung windows, 1x OW80 Double hinged window.
x19 Bettio screens
SSF - OC issued', NULL, '2025-11-20', NULL, 'In Progress', 'Installation update: * Flyscreen installation finished on 7 small windows. 9pcs on hold as cutomer request
* Glazing bead from Oryx / Origin ETA 2nd week of July
* Final Cleaning to be done (after flyscreen installation)', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0002', 'Cluster 43,  V6', 'GTS', 'x5 VS28 Sliders , x11 CW50, x4 single doors, x4 TH', NULL, '2026-01-02', NULL, 'On Hold', 'Installation update: * Final Cleaning to be done. (GTS needs one more weeks to provide access)', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0003', 'Meadows 7 Villa 46', 'GTS', 'Main door replacement', NULL, '2025-12-04', NULL, 'In Progress', 'Installation update: * Main door replacement will be done on July 5', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0004', 'Sobha Hartland Villa 33 (TYPE 1)', 'GTS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x2 Top Hung window
x2 Fixed Window
x7 Sliding Door', NULL, '2026-03-11', NULL, 'In Progress', 'Installation update: * Final cleaning and snagging pending. Will be finish on July 4.
* Garage doors is delivered but site not ready for installation. Awaiting for GTS.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0005', 'Sobha Hartland Villa 34 (TYPE 1)', 'MACS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x2 Top Hung window
x2 Fixed Window
x7 Sliding Door
x1 Skylight', NULL, '2026-03-11', NULL, 'In Progress', 'Installation update: * Main door pending. For bonding HPL, sheets are at proal on Jun 29.
* Snagging of all installation hasn''t commenced due to ongoing Reno works by MACS as frames are all protected.
* Garage doors is delivered but site not ready for installation. Awaiting for MACS.
* Final cleaning and snagging pending.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0006', 'Sobha Hartland Villa 35', 'MACS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x3 Top Hung window
x3 Fixed Window
x7 Sliding Door
x1 Skylight', 230000.0, '2026-04-21', NULL, 'In Progress', 'Installation update: * Main door frame ready from BES. Awaiting HPL panel drawing from BES and sheets needs to send to ABS for cutting and Proal for bonding.
* Final cleaning and snagging pending.
* Garage doors is delivered but site not ready for installation. Awaiting for MACS.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0007', 'Sobha Hartland Villa 36', 'GTS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x3 Top Hung window
x3 Fixed Window
x7 Sliding Door
x1 Skylight', NULL, '2026-04-21', NULL, 'In Progress', 'Installation update: * Main door frame ready from BES. Awaitng HPL panel drawing from BES and sheets needs to send to ABS for cutting and Proal for bonding.
* CW for front Facade, Item W8 & W9 L shape SD,  frame installed and glass will be ready on July 10.
* Frame and glass installation in progress.
* Garage doors is delivered but site not ready for installation. Awaiting for GTS.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0008', 'Sobha Hartland Villa 37', 'GTS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x2 Top Hung window
x3 Fixed Window
x7 Sliding Door
x1 Skylight', NULL, '2026-04-21', NULL, 'In Progress', 'Installation update: * Main door frame ready from BES. Awaitng HPL panel drawing from BES and sheets needs to send to ABS for cutting and Proal for bonding.
* CW for front Facade frame delivered. Awaiting GTS for water proof.
* Frame and glass installation in progress.
* Item W8 & W9 L shape SD only glass pending will be done on July 6', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0009', 'Sobha Hartland Villa 38', 'GTS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x2 Top Hung window
x3 Fixed Window
x7 Sliding Door
x1 Skylight', NULL, NULL, NULL, 'Not Started', 'Installation update: *Site measurement done except L shape sliding door. Awaiting Shamal to fix the U channel.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0010', 'Sobha Hartland Villa 39', 'GTS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x2 Top Hung window
x3 Fixed Window
x7 Sliding Door
x1 Skylight', NULL, NULL, NULL, 'Not Started', 'Installation update: Site Not Ready for Measurement - to follow up with GTS', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0011', 'Sobha Hartland Villa 40', 'GTS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x2 Top Hung window
x3 Fixed Window
x7 Sliding Door
x1 Skylight', NULL, NULL, NULL, 'Not Started', 'Installation update: Site Not Ready for Measurement - to follow up with GTS', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0012', 'Sobha Hartland Villa 41', 'GTS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x2 Top Hung window
x3 Fixed Window
x7 Sliding Door
x1 Skylight', NULL, NULL, NULL, 'Not Started', 'Installation update: Site Not Ready for Measurement - to follow up with GTS', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0013', 'Sobha Hartland Villa 42', 'GTS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x2 Top Hung window
x3 Fixed Window
x7 Sliding Door
x1 Skylight', NULL, '2026-04-21', NULL, 'In Progress', 'Installation update: * Front Door, Front Façade, Kitchen Window, Laundry Door, Maid''s Room window, Garage door not ready for measurement. (GF - PMK & GTS temporary office)
* All the glass and frame installation done on the first floor. Except item W8 Glass installation is pending and will be done on July 9.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0014', 'Sobha Hartland Villa 43 (TYPE 2)', 'GTS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x2 Top Hung window
x3 Fixed Window
x7 Sliding Door
x1 Skylight', NULL, '2026-03-11', NULL, 'In Progress', 'Installation update: * Main door pending. For bonding HPL, sheets are at proal on Jun 29.
* Aluminium Cladding Lucito to send order.
* Only 2x CW Glass installation pending on ground floor as waiting for Shamal to be finished staircase welding.
* Snagging of all installation hasn''t commenced due to ongoing Reno works by GTS as frames are all protected.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0015', 'Sobha Hartland Villa 44 (TYPE 2)', 'GTS', 'x1 Entrance Door with Fixed Window
x1 Single Door
x2 Top Hung window
x3 Fixed Window
x7 Sliding Door
x1 Skylight', NULL, '2026-03-11', NULL, 'In Progress', 'Installation update: * Main door pending. For bonding HPL, sheets are at proal on Jun 29
* Item 10 & 12 (Sliding doors) glass installation will be done by July 7.
* Snagging of all installation hasn''t commenced due to ongoing Reno works by GTS as frames are all protected.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0016', 'Meadows 6 V2', 'MACS', 'Front door - Shaoki - Production in progress
x5 SCHUCO Sliding doors and x3 schuco Sliding windows , x3 EFP Single doors,  x6 EFP Fixed Windows. x4 EFP Top Hung windows.
Bettio Flyscreens
x13 Screens (x6 Neoscenica - V1 standard – grey mesh – Color RAL7016 MATT – finished dimensions – 1 Door/2Doors – equipped with sliding profile & x7 Estetica - Anima21 – grey mesh – Color RAL7016 MATT – finished dimensions – with brake).', NULL, '2025-12-03', NULL, 'On Hold', 'Installation update: * x2 in the Garage - The openings are not yet ready.

When do you feel the garage door openings will be ready ?', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0017', 'Meadows 2 - V6', 'MACS', '5 Fixed window - Installed
4 T&T - Installed
6 VS-28 (I slider and x5 sliding windows). Installed - End caps for Interlock balance
x1 Front door with Bar Handles and Biometric. Outside is HPL, inside is Aluminium panel (RAL 1013) - Pending
x1 EFP Single door with Sandwich Panel. Pending , this will be ready for collection on 11/12/25', NULL, '2025-12-12', '2026-07-07', 'In Progress', 'Installation update: * Main door replacement to be done on July 7.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0018', 'Cluster 38, V16', 'BUILD STUDIO', 'x4 VS28, x1 VS36, x4 TH Window, x4 BH Window x1 Hinged Door.x7 EFP CW - EPDM
Main pivot door, SHAOKI', NULL, '2025-12-20', NULL, 'In Progress', 'Installation update: * Final Cleaning pending. Awaiting for Build studio. Plan is to close this out by 10th July this week.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0019', 'Palm Jumeirah - A6', 'MACS', 'x20 Schuco Curtain Wall
x1 Schuco Curtain Wall with Jumbo Glass
x1 Schuco Curtain Wall with Smart Film
x2 Top Hung Window with Clear Glass
x3 Top Hung Window with Smart Film
x1 Top Hung Window with Frosted Glass
x5 Single Door with Clear Glass
x1 Single Door with Frosted Glass
x1 Sliding Window
x2 Sliding Door', NULL, '2026-03-30', NULL, 'In Progress', 'Installation update: * AWS 65 side hung window material is at WA and expected from WA on July 4. no feedback yet
* Bettio flyscreen installation for sliding door in progress will be finish on July 7.

Ed will escalate with WA by 6/7/26', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0020', 'Wild Flower - K36', 'MACS', 'x1 Main Door
x14 Vetromax Curtain Wall
x1 Vetromax Curtain Wall with Jumbo Glass
x1 Skylight with Smart Film
x7 Vetromax Top Hung Window
x3 Vetromax Arch Doors
x4 Vetromax Arch Windows
x1 Single Door with Fixed Window
x1 Sliding Door with Curtain Wall on Top
x3 Sliding Doors', NULL, '2023-03-05', NULL, 'In Progress', 'Installation update: * Main door new scope (Client wants to change the door).', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0021', 'Mansion - Villa 15', 'GTS', '11x S28 Sliding door
1x CW35 Fixed CW with Pivot door
1x CW35 Fixed CW (Jumbo) (on hold)
1x S36 Sliding door
8x CW35 Fixed CW window
2x Single-hinged door
6x T&T window
1x skylight (on hold)', NULL, '2026-05-01', NULL, 'In Progress', 'Installation update: * All Glass installation done. Main door needs to remove the glass and replace by aluminum as per client request. (This is in quotation stage).

* Item 7 Jumbo glass needs to flip because of installation was the other way around. On July 6

Customer wants to add glass on Balcony area and this will be additional scope if lucito confirm. Will proceed with quotation process', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0022', 'Jasmine Leaf 3, Villa 9', 'GTS', '32x Fixed CW Window (WA)
5x Single Hinged Door (WA)
7x sliding door (BES)
1x Motorized Sliding door (BES)', NULL, '2026-06-19', NULL, 'Not Started', 'Installation update: * EFP done, BES frame pending for motorized sliding door because of the opening issue. Steve and Paddy will speak to the customer by 7th July. 
* The glass installation in progress.
* 1 Jumbo & Broken glass delivery pending from Sejal. July 7 ETA.
* Roof floor material awaiting delivery by', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0023', 'Victory Heights, Estella Villa 12', 'GTS', '15x EFP 50 CURTAIN WALL WINDOW (Wed)
3x ADS 65 HD SINGLE HINGED DOOR (Friday)	
2x ASE 54 PD ME SLIDING DOOR	(Monday)
3x AWS 65 BOTTOM HUNG WINDOW	(Friday)	
1x AWS 65 BOTTOM HUNG WINDOW WITH FIXED PANEL (Friday)', NULL, NULL, NULL, 'Not Started', 'Installation update: Awaiting for Material delivery
Some of EFP 50 CURTAIN WALL WINDOW will be ready on July 8
ADS 65 on July 10 (Friday)	
ASE 54 PD on July 13 (Monday)
AWS 65 on July 17 (Friday)', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0024', 'Villa 164, Golf Place', 'Sirius Invest', 'Schuco (RAl 7006)
5x ASE 54 PD MM Sliding Door
3x AWS 65 Top Hung Window 
1x Schuco ADS 65 HD Single Hinged Door  With Fixed Side Panel
1x AWS 65 Top Hung Window With Fixed Panel Below', 230000.0, NULL, NULL, 'Not Started', 'Installation update: Awaiting material delivery on July 17', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0025', 'Al Fujan Villa 1876', 'MACS', '1x CW35 FIXED CURTAIN WALL WINDOW
2x CW35 FIXED CURTAIN WALL WINDOW (JUMBO)
4x F45 FIXED WINDOW
3x S28 SLIDING DOOR
1x SINGLE HINGED DOOR', 20000.0, NULL, NULL, 'Not Started', 'Installation update: Material delivered 4th july from BES and glass will be delivered on July 7', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0026', 'Meadows 9, St. 6, Villa 15', 'JCT Contracting', '4x SCHÜCO 54 PD ME SLIDING DOOR
3x SCHÜCO ADS 65 HD SINGLE HINGED DOOR
8x SCHÜCO ASE 54 PD ME SLIDING WINDOW
3x SCHÜCO AWS 65 FIXED WINDOW
6x SCHÜCO AWS 65 TOP HUNG WINDOW', 100000.0, NULL, NULL, 'Not Started', 'Installation update: Awaiting quotation and material from supplier', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0027', 'Wild Flower - K80', 'ZINTERIO Tech Works LLC', '1x Schuco ADS 65 HD Entrance Pivot Door With Schuco Fws 50 Curtain Wall
1x Schuco Ads 65 HD Single Hinged Door', NULL, NULL, NULL, 'Not Started', 'Installation update: 1) Ral & glass sample confirmation awaiting from client', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0028', 'Marina Residence 2, apt 606', 'Nikki Farmer', '1x ADS 65 HD SINGLE HINGED DOOR
1x ASE 54 PD ME SLIDING WINDOW
5x ASE 55 LIFT & SLIDE SLIDING DOOR
3x AWS 65 TOP HUNG WINDOW
1x AWS 65 TOP HUNG WINDOW WITH FIXED PANEL BELOW', NULL, NULL, NULL, 'Not Started', 'Installation update: Waiting RAL sample from WA, alternatively we should explore the JOTUN option by 7th July, this has a cost impact of 2500 AED
 Glass sample available , Lucito will try confirm the glass by 7th July with the client', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0029', 'RASHA Vila - Villa 85', 'Giovanni', 'Full project order - Schüco ASE 36 PD sliding doors and Schuco AWS 65 Side hung windows & bottom hung window with fixed panels
Glass Sunguard HP neutal + 50
Ral 8017Matt', NULL, NULL, NULL, 'Not Started', 'Installation update: Awaiting quotation and material from supplier
Proposed installation Date : 
Sent cutting list on July 3', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0030', 'MEADOWS 1, VILLA 3', 'MACS', 'RAL 9016 SMO (MATT)

2x EFP F43 FIXED WINDOW
3x EFP SINGLE HINGED DOOR
2x EFP TOP HUNG WINDOW
8x ASE 36 PD ME SLIDING DOOR
3x ASE 36 PD ME SLIDING WINDOW', NULL, NULL, NULL, 'Not Started', 'Installation update: Awaiting quotation and material from supplier
Proposed installation Date :', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0031', 'MEADOWS 5, VILLA 43, STREET 3', 'MACS', '8x F45 FIXED WINDOW
3x S28 SLDIING WINDOW
3x S28 SLIDING DOOR
1x S36 SLIDING DOOR
5x TOP HUNG WINDOW
1x EUROLUX EFP SINGLE HINGED DOOR', NULL, NULL, NULL, 'Not Started', 'Installation update: Sent confirmation and quotation requested from BES 3/7/26. Request for Aug 10 delivery', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0032', 'VILLA C19, REDWOOD PARK, JGE', 'MACS', '1x SCHUCO ADS 65 HD ENTRANCE PIVOT DOOR
4x SCHUCO ADS 65 HD SINGLE HINGED DOOR	
2x SCHUCO ASE 70 PD SLIDING WINDOW	
9x SCHUCO ASE 70 PD ME GEN2 SLIDING DOOR	
13x SCHUCO AWS 65 FIXED WINDOW	
6x SCHUCO AWS 65 TOP HUNG WINDOW WITH FIXED PANEL BELOW	
3x SCHUCO ADS 65 HD SINGLE HINGED DOOR', NULL, NULL, NULL, 'Not Started', 'Installation update: Awaiting client approval for design which was submitted on : 17th june', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0033', 'VILLA 8, DESERT LEAF 1, AL BARARI', 'GTS', '12x CW35 FIXED CURTAIN WALL WINDOW (JUMBO)
16x F45 FIXED WINDOW
11x S36 SLIDING DOOR
1x S36 SLIDING DOOR WITH CW35 FIXED CURTAIN WALL WINDOW (JUMBO) 
6x SINGLE HINGED DOOR
2x TOP HUNG WINDOW', NULL, NULL, NULL, 'Not Started', 'Installation update: Awaiting client approval for design which was submitted on : 25th June', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0034', 'VILLA 80, ESMERALDA, VICTORY HEIGHTS', 'LCI Fitout', '1x EFP F43 ARCHED FIXED WINDOW
5x EFP F43 FIXED WINDOW
4x EFP SINGLE HINGED DOOR
2x EFP TOP HUNG WINDOW
1x ADS 65 SINGLE HINGED ENTRANCE DOOR WITH FIXED PANEL
5x ASE 36 PD ME SLIDING DOOR
8x ASE 36 PD ME SLIDING WINDOW', NULL, NULL, NULL, 'Not Started', 'Installation update: Client approved on July 2, Lucito will carry final site measurment on 7th July', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0035', 'VILLA 3, DESERT LEAF 3, AL BARARI', 'GTS', '8x CW35 FIXED CURTAIN WALL WINDOW - JUMBO
1x CW35 FIXED CURTAIN WALL WINDOW (4 PANELS)
45x F45 FIXED WINDOW
2x S28 SLIDING DOOR
6x S36 SLIDING DOOR
5x SINGLE HINGED DOOR
3x TOP HUNG WINDOW
1x ATLAS ROOF LANTERN SKYLIGHT
1x FLAT SKYLIGHT', NULL, NULL, NULL, 'Not Started', 'Installation update: Client approved design on 3rd July, this needs to go into production ASAP.
Farah is going to send this to BEs on 6th July for quotation.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0036', 'VILLA 10, DESERT LEAF 6, AL BARARI', 'MACS', '1x SKYLIGHT
1x PIVOT DOOR WITH CW35 FIXED CURTAIN WALL
2x BOTTOM HUNG WINDOW
15x CW35 FIXED CURTAIN WALL WINDOW
5x S28 SLIDING DOOR
13x S36 SLIDING DOOR
1x S44 SLIDING DOOR
2x SIDE HUNG WINDOW
2x SINGLE HINGED DOOR WITH FIXED PANEL
6x TILT & TURN WINDOW
2x VETROSLIDE 28 SLIDING DOOR', NULL, NULL, NULL, 'Not Started', 'Installation update: Design for opening sizes sent to Chelsea July 1st by Farah, Awaiting approval.', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0037', 'C35, DISTRICT 6, JUMEIRAH PARK', 'MACS', 'Schuco & EFP', NULL, NULL, NULL, 'Not Started', 'Installation update: Drawing approved on July 1 - 
Farah will produce the manufaturing drawings on 8th July', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0038', 'VILLA D58, FLAMETREE RIDGE, JGE', 'MACS', 'Schuco doors & windows', NULL, NULL, NULL, 'Not Started', 'Installation update: Waiting for the updated drawing from Christine', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0039', 'Cluster 18 Villa 3, Jumeirah Islands', 'MACS', 'All VETROMAX systems, will try to propose VETROMAX embedded frames x3 items by Steve', NULL, NULL, NULL, 'Not Started', 'Installation update: Customer will visit Emirates glass showroom on July 7
Drawing were submitted to MACs on July 1st', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0040', 'VILLA 50, HATTAN, ARABIAN RANCHES', 'Build Studio', 'Schuco doors and windows
SSF
Skylight from BES
EFP CW jumbo
Internal shower partition', NULL, NULL, NULL, 'Not Started', 'Installation update: 1) Follow up with steve or with client regarding the current status to proceed. Ral color was approved

Update required from Steve by 7/7/26', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0041', 'Villa 46, Novelia, Victory Heights', 'GTS', 'Schuco front door
Schuco doors and windows
Motorized window
Internal shower partition
Skylight', NULL, NULL, NULL, 'Not Started', 'Installation update: 1) Farah will send initial drawing on 10th July
2) Section details needs to get for Motorized window from Arki libart supplier', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0042', 'Villa 9, Street 1, Samara, Arabian Ranches 2', 'Mr. Roscoe', 'Rabel bifold door
EFP windows
Schuco sliding windows', NULL, NULL, NULL, 'Not Started', 'Installation update: Final measurments sent to Farah on June 30th , Farah submitted the final design on July 10th', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0043', 'PALM PRIVATE APARTMENT', 'Coco Nate Design Services', 'Schuco doors and windows', NULL, NULL, NULL, 'Not Started', 'Installation update: Farah / Fadil will submit the initial drawings on 13/7/26', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0044', 'D48, PALM JUMEIRAH', 'GTS', NULL, NULL, NULL, NULL, 'Not Started', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0045', 'D63', NULL, 'Flyscreens and snags', NULL, '2025-12-03', '2025-12-05', 'Completed / Handed Over', 'Completed

Team on site: Sammy +1', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0046', 'CLUSTER 10, VILLA 16', NULL, 'x3 Single doors, 
x8 CW, 
x3 TH windows, 
x5 S28 Sliders , 
x3 S36 Sliders, 
x1 TT Window, 
x1 TH window with x1 CW. 
x1 L ANGLE 150mm X 100mm (1 bar 6000mm)', NULL, '2025-12-07', '2026-01-21', 'Completed / Handed Over', '2/1/26: Single door in the Garage requires resizing due, beam obstruction. 
Farah informed to issue a variation.
Glass requires replacement as well, order sent to GMI.
L angles required for x2 GF bathrooms. 200mm x 50mm not available. 
We will will make the L angles from box sections 
112/1/26: 2/1/26: Single door in the Garage requires resizing due, beam obstruction. 
Lucito is aiming to carry this out by 14/1/26 with Albert''s. 
20/1/26 : Ashok''s will install the resized single door and L angles for the x2 windows on the ground floor.
20/1/26: All works will be completed by 21/1/26: Lucito will carry out a snag completion inspection on 21/1/26 to very 100% completion
29/1/26: Final cleaning in progress , this will be completed today
Done. FInal invoice Issued

Team on site: Ashok 4', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0047', 'Cluster 10 V16', NULL, 'JUMBO GLASS - DELIVERY & INSTALLATION', NULL, '2025-12-23', '2026-01-20', 'Completed / Handed Over', 'Completed

Team on site: LUCITO/SELECT/AJI', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0048', 'Cluster 42 V6', NULL, 'Front Door - Shaoki - Phillips lock - ordered ETA 5/12/25
2 hinge door
4 VS-28 with Keylock
2 VS-36 with Keylock', NULL, '2025-12-04', '2026-01-06', 'Completed / Handed Over', '5/1/26: final cleaing in progress, All snags are completed. We can handover the villa on 6/1/26.
7/1/26: Team will complete the cleaning of this site by 10/1/25.
12/1/26: Keys for pop out lock needs modification as it is not functional for the 2nd lock.. it is too short.
20/1/26: Modified longer keys issued to Lucito, Lucito.Keys tested and are ok .
29/1/26: Suwai will chase Aseem today for the pop out lock keys.
9/2/26: Pop-out keys are ready for collection with Hazem. Lucito will arrange collection today
14/2/26: completed
Done
Final Invoice not yet paid

Team on site: Mark''s Team', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0049', 'Meadows 5 - V6', NULL, 'Snags
Dummy Handle installation on folding door
Cleaning of Glass & Frames', NULL, '2025-12-06', '2025-12-08', 'Completed / Handed Over', 'Done
Done

Team on site: Angelo +1', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0050', 'Savannah Villa 15', NULL, 'Snags and replacement Glass for Sandwich panels.
This will be ready for Collection on Saturday 6/12/25', NULL, '2025-12-06', '2025-12-06', 'Completed / Handed Over', 'Only Pending item is :
1. cleaning of the Villa.- Lucito will schedule this on 8/12/25.
2. Frosted Glass for Bathroom, Shamal will confirm installation ETA by COP 8/12/25.
18/12/25: Cleaning in progress, final invoice can be issued, Loureanne informed
Done

Team on site: Alex +1', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0051', 'Cluster 24, Villa 8', NULL, 'VETROMAX - 1x Family Room door with smart lock, Door, 1x TH window , & 1x single door- Production & Delivery', NULL, '2025-12-15', '2026-02-28', 'Completed / Handed Over', '5/1/25: Snagging required for item 1, This will be completed by 15/1/26. Subject to access being granted by Nafeel.
20/1/26: The single door atteached to the CW, has a door striker which needs to be installed properly. Lucito will arrange this by COP 24/1/26.
14/2/26: Awaiting for the replacement for door handle
Replacement handle installed.
*Loureanne adviced to issue the final invoice today 27/2/26
Done
Final Invoice not yet paid', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0052', 'Meadows 5 Villa 9', NULL, 'Silicone in glass, for item 9 ? - SL glass', NULL, '2025-12-15', '2026-01-10', 'Completed / Handed Over', '5/1/26: We will install this once BES confirms that the glass has been bonded
Done
Final Invoice not yet paid

Team on site: ALBERT', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0053', 'FTR D31', NULL, 'x3 Vetromax F45 Fixed Window
x1 Vetromax F45 Corner Window', NULL, '2026-02-23', '2026-03-26', 'Completed / Handed Over', 'Installation completed.
*Loureanne instructed to issue the final invoice, 27/2/26.
Done
Final Invoice not yet paid

Team on site: Angelo', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0054', 'LA AVENIDA Villa 05', NULL, '6x S28 SLIDING DOOR
3x F45 FIXED WINDOW', NULL, '2026-02-23', '2026-03-06', 'Completed / Handed Over', 'the goal is to complete by the end of February
 Installation in progress
*Interlock profiles will be delivered 3/3/26 (Initial profiles had PC damage)
*Georgian Bars will be finish on Mar 6
Done
Final Invoice not yet paid waiting for lucito site report

Team on site: Sammy & Albert', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0055', 'FTR D14', NULL, 'Front Door - Shaoki - with smart Lock.
"16 fix window
 5 fix window with bottom hung
 3 Arched fixed window
 1 VS-28
 (x2 3700 Folding doors) completed , (Balance is Escutcheon)
1x Top Hung & 1x single door (Half Glass , half sandwich panel).
Additional - Single door in garage - half glass half sandwich panel
+ Georgian Bars', NULL, '2025-12-03', '2026-02-28', 'Completed / Handed Over', '18/12/25: Door and window in Maids  resized. 
18/12/25: Main front door will be installed by Shaoki today.
18/12/25: box section reqd for folding door to enable us install a restrictor. Box sections order ETA 18/12/25.
18/12/25: Garage door which was a variation is also pending.
30/12/25: Hinge Door with Sandwich panel will be delivered from WA on 31/12/25
5/1/26: Single door in garage is being installed today
7/1/26: x1 Glass will be collected from SL today and installed
7/1/26: Georgian bars require review and approval. customer has commented on the mock up, wants the Edge to be smooth, Steve to advice on the next action to progress .
12/1/26: Plan to move forward with Georgian bars required from Steve, 

We will wait for Vanessa to return on 8/1/26, so confirm we cannot make the edges smoother.
18/12/25: Main front door installed.GTS wants the door moved to left. Discussed and approved with Steve. this will me closed out on 28/1/26.
12/1/26: Glass for Garage door will be installed today.
9/2/26: SSF for arched window requires replacement - Oryx to arrange this 12/2/26: Julian to confirm if this is FOC.
9/2/26: Tint film mock up requested by customer for outside of glass in Master bedroom. Oryx will install this on 12/2/26
14/2/26: Installation of Exterior Film to be done (additional scope)/ Final Cleaning to be done & Main door snagging
*Installation of Exterior Film to be done on 6/3/26.
* Final Cleaning to be done on 26st Feb, 2026.
*Main door snagging to be done on 25th Feb 2026. Move to March 11 & Exterior Film from Oryx pending
(Door limiter and gap sealing) - 9/3/26
Final Invoice Sent
29/1/26: Confirmation required from GTS Vanessa if we can proceed with the installation . has the mock been approved.  Steve, to confirm with Vannessa today

Team on site: Albert +2', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0056', 'LTV B21', NULL, 'Front Door from Vetromax with OURO UNIFY LOCK
5 CW
1 PD with HPL
8 fix window
8 top hung
2 VS-28
3 VS-36
3 hinge door
x10 Bettio Flyscreens
x3 Skylight - JUMBO glass delivery & Installation
+ x10 Bettio Flyscreens.', NULL, '2025-12-08', '2026-02-28', 'Completed / Handed Over', '5/1/26: Bettio screens installation in progress
7/1/26: OURO smart lock will be installed on 8/1/26. 
7/1/26: x2 VETROMAX single doors ordered as a variation. Production in progress, required by 22/1/26.
12/1/26: Pending jobs. x2 Flyscreens, Flashing for Skylight, Smart lock for front door. Plan is to close these out by 17/1/26.
20/1/26: Flashing & Smart lock for front will be installed by 22/1/26.
20/1/26: x2 single doors ready for collection, Lucito to arrange.
29/1/26: Pending items , Bettio sliding profile, Smart lock and Cleaning, Plan is , Lucito will verify with MACS when we can install the amrt lock and commence final cleaning. .
29/1/26: tTe sliding profile will be installed today 29/1/26.
9/2/26: Smart lock for the main door is being today by Ouro
9/2/26: x1 Bettio bottom rail still pending , will be installed once it arrives on 14/2/26
14/2/26: Configuration of smart lock to be done (required home internet connection)/Required x2 stopper & x2 hook receiver for Vetromax Sliding Door (Item 12)/ Awaiting for the delivery of x1 Flyscreen bottom rail/ Final Cleaning
*Configuration of smart lock to be done (required home internet connection)
*Final Cleaning
Final Invoice Sent
Track to be delivered on 21/1/26

Team on site: Angelo, Alex +2, Ouro', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0057', 'Al Barari D06', NULL, '4 VS-28,
x12 CW (Item 17 is a U shaped CW, Glass size will be obtained after the installation).
x4 EFP Single Door, x4 EFP TH Window.
+ U SHAPED GLASS (ITEM 17)', NULL, '2025-12-28', '2026-02-28', 'Completed / Handed Over', '7/1/26: Front Façade is not ready for us to measure, so Glass, Frames & Front Door not ordered.
20/1/26: quote received from DECOMASTER for front CW facade. Fadil will review this with SC today 11,100 including Aluminium cladding.
28/1/26: CW from Decomaster delivered.
29/1/26: CW from Decomaster can only be installed from the 31/1/26, due to ongoing Marble installation works by GTS .
9/2/26: Front door (Shaoki) and CW pending for front Facade. Smart lock also required from GTS (Karen) , the client will free issue the smart lock. Suwai to chase Karen today.
16/2/26: x2 pressure plate cover required from Decomaster/Awaiting for Main door delivery and installation/Snagging & Final Cleaning
*Awaiting for Main door delivery and installation (Shaoki) - Done on March 4
*Cladding will be install on Mar 6
*Main Door (Shaoki) - to provide normal key lock as per drawing.
*Snagging & Final Cleaning
Final Invoice Sent
7/1/26: Sizes issued to Fadil today, we will order the glass ASAP. Frames installed

Team on site: Ashok', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0058', 'Villa 12, Street D22, District 8, Jumeirah Village Triangle (JVT)', NULL, 'x1 Schuco AWS 65 Fixed window with 51mm frame thickness
+ x1 Schuco AWS 65 Fixed window', NULL, '2026-03-03', NULL, 'Completed / Handed Over', '3/3/26: Fadil request quotation to WA
4/3/26: Received quotation. LPO687
9/3/26: Order confirmed and proceed with the transportation
11/3/26: Confirm to proceed with production and request for earlier than Mar 25 if possible
25/0326: To collect by Lucito on Sat Mar 28
Final Invoice Sent
11/3/26: RFQ sent to Safelite
12/3/26: Updated size RFQ sent 
23/3/26: Ready to collect
25/3/26: Collected', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0059', 'Meadows 9, Street 14, Villa 49', NULL, 'Item 6 - 2pcs
+ Frame', NULL, '2026-03-25', NULL, 'Completed / Handed Over', '25/3/26: remake glass from old project. Sent RFQ to Select.
26/3/26: Rec quotation and request for PO
31/3/26: Payment done. Ready to collect. Lucito will collect on April 2
6/4/26: Size wrong issue. Supplier will make replacement and will be ready on April 8
8/4/26: Ready to collect. informed Lucito
Requested to Ate
25/3/26: to get in the next week', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0060', 'Green Community Villa 537', NULL, 'Snagging items;
Glass Buffing
Door Stopper
Wrapping of the frames', NULL, NULL, '2026-04-13', 'Completed / Handed Over', 'All Gazing Works Completed
Wrapping of Frames to be done
*Refixing of removed / damaged rubber. (to be completed on 13/04/2026)
Requested to Ate', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0061', 'JVT Villa 20', NULL, 'x5 Sliding Doors', NULL, '2026-03-30', '2026-04-17', 'Completed / Handed Over', '* Awaiting for replacement of x1 interlock profile (delivery date to be confirmed)
Requested to Ate', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0062', 'Springs 9', NULL, 'EFP door', NULL, NULL, '2026-04-20', 'Completed / Handed Over', 'Barrel lock and Smart lock configuration & Final cleaning', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0063', 'Desert Leaf 3 Villa 2', NULL, '2 VS-28
5 VS-36
6x EFP Single doors & 8x TH Windows
11x Curtain Wall
ROOF Floor - x3 CW from DECO, EFP items from WA.', NULL, '2025-03-12', '2026-09-05', 'Completed / Handed Over', '*Replacement of bottom profiles of single door completed on 9/5/26.
16/5/26: Touch up on frames and accessories will be completed today, this was started on the 14/5/26.
16/5/26: final invoice can be issued on 18/5/26.
16/5/26: Please notify Loureanne to issue the final invoice on 18/5/26
Requested to Ate on May 18', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0064', 'Balqis Residence - Villa 33', NULL, 'VETROMAX (All items are RAL 9016M apart from item 44 which is RAL 9005M).
FRONT Door - THIRAL', NULL, '2026-05-01', '2026-11-05', 'Completed / Handed Over', '* Smart Film issue. resolved on 9/5/26≥
16/5/26 : Snags regarding silicone will be resolved on 15/5/26
16/5/26: Please notify Loureanne to issue the final invoice on 18/5/26
Requested to Ate on May 18', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0065', 'JCT Contracting', NULL, 'Zulal 02 - Villa 116', NULL, '2026-02-23', '2026-05-06', 'Completed / Handed Over', 'x9 Vetromax Fixed Windows
x4 Vetromax Sliding Doors
x2 Vetromax Top Hung Windows with Clear Glass
x2 Vetromax Top Hung Windows with Frosted Glass
x3 Vetromax Single Door
x1 Vetromax Side Openable Window
x4 Vetromax Openable Window with bottom fixed window', NULL, NULL, NULL, NULL, NULL, NULL),
  ('P-0066', 'GTS', NULL, 'Mirador , Street 1 - Villa 3', NULL, NULL, NULL, 'Completed / Handed Over', 'x2 windows Sealing - Lucito will arrange for the windows to be sealed once we receive the sealing strip from Amazon. by 17/6/26

Team on site: TBC', NULL, NULL, NULL, NULL, NULL, NULL)
on conflict (ref) do nothing;
