{React, ReactBootstrap} = window
{Grid, TabbedArea, TabPane} = ReactBootstrap

simulater = require '../lib/simulate'
{Ship, ShipOwner, Attack, AttackType, Stage, StageType} = require '../lib/common'
AttackTable = require './attack-table'


BattleDetailArea = React.createClass
  getInitialState: ->
    body = {"api_dock_id":1,"api_ship_ke":[-1,543,527,522,592,576,576],"api_ship_lv":[-1,1,1,1,1,1,1],"api_nowhps":[-1,96,78,79,49,57,56,90,76,60,66,37,37],"api_maxhps":[-1,96,78,79,49,57,56,90,76,60,66,37,37],"api_midnight_flag":0,"api_eSlot":[[509,509,525,529,-1],[505,506,515,525,-1],[505,506,525,525,-1],[550,550,545,525,-1],[502,545,542,-1,-1],[502,545,542,-1,-1]],"api_eKyouka":[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],"api_fParam":[[139,0,104,118],[70,0,88,83],[49,0,79,79],[63,139,49,63],[84,84,72,77],[80,88,80,78]],"api_eParam":[[85,0,70,96],[68,48,40,70],[58,42,30,60],[64,92,96,68],[38,66,32,26],[38,66,32,26]],"api_search":[1,1],"api_formation":[1,2,2],"api_stage_flag":[1,1,1],"api_kouku":{"api_plane_from":[[2,3],[-1]],"api_stage1":{"api_f_count":165,"api_f_lostcount":3,"api_e_count":0,"api_e_lostcount":0,"api_disp_seiku":1,"api_touch_plane":[144,-1]},"api_stage2":{"api_f_count":98,"api_f_lostcount":3,"api_e_count":0,"api_e_lostcount":0},"api_stage3":{"api_frai_flag":[-1,0,0,0,0,0,0],"api_erai_flag":[-1,0,1,0,0,1,0],"api_fbak_flag":[-1,0,0,0,0,0,0],"api_ebak_flag":[-1,0,0,0,0,0,0],"api_fcl_flag":[-1,0,0,0,0,0,0],"api_ecl_flag":[-1,0,1,0,0,0,0],"api_fdam":[-1,0,0,0,0,0,0],"api_edam":[-1,0,284,0,0,0,0]}},"api_support_flag":0,"api_support_info":null,"api_opening_flag":1,"api_opening_atack":{"api_frai":[-1,0,0,0,4,0,0],"api_erai":[-1,0,0,0,0,0,0],"api_fdam":[-1,0,0,0,0,0,0],"api_edam":[-1,0,0,0,0,0,0],"api_fydam":[-1,0,0,0,0,0,0],"api_eydam":[-1,0,0,0,0,0,0],"api_fcl":[-1,0,0,0,0,0,0],"api_ecl":[-1,0,0,0,0,0,0]},"api_hourai_flag":[1,1,0,0],"api_hougeki1":{"api_at_list":[-1,1,7,4,10,6,2,12,5,3],"api_at_type":[-1,6,0,0,0,0,0,0,2,0],"api_df_list":[-1,[9],[5],[7],[4],[11],[10],[3],[12,12],[7]],"api_si_list":[-1,[25,9,9],[509],[12],[550],[90],[-1],[502],[90,6],[-1]],"api_cl_list":[-1,[2],[0],[1],[1],[1],[1],[0],[1,1],[1]],"api_damage":[-1,[178],[0],[7],[4.1],[56],[69],[0.1],[82,82],[4]]},"api_hougeki2":{"api_at_list":[-1,1],"api_at_type":[-1,2],"api_df_list":[-1,[7,7]],"api_si_list":[-1,[9,9]],"api_cl_list":[-1,[1,1]],"api_damage":[-1,[100,90]]},"api_hougeki3":null,"api_raigeki":null}
    body.isCombined = false
    body.isWater = false
    body.sortieID = [136, 466, 278, 118, 194, 319]
    body.combinedID = [0,0,0,0,0,0]
    result = simulater.simulate(body)

    result: result

  # componentDidMount: ->
  #   window.addEventListener 'game.response', @handleResponse
  # componentWillUnmount: ->
  #   window.removeEventListener 'game.response', @handleResponse

  # handleResponse: (e) ->
  #   {method, path, body, postBody} = e.detail
  #   switch path
  #     when '/kcsapi/api_req_sortie/battle'

  render: ->
    <div>
      <Grid>
      <TabbedArea defaultActiveKey={3} animation={false}>
        <TabPane eventKey={1} tab="Aerial Combat">
          <p>Stage 1</p>
          <p>Stage 2</p>
          <p>Stage 3</p>
          <AttackTable attacks={@state.result[0].detail} />
        </TabPane>
        <TabPane eventKey={2} tab="Torpedo Salvo">
          <p>Opening Torpedo Salvo</p>
          <AttackTable attacks={@state.result[1].detail} />
          <p>Closing Torpedo Salvo</p>
        </TabPane>
        <TabPane eventKey={3} tab="Shelling">
          <p>Shelling, 1st Round</p>
          <AttackTable attacks={@state.result[2].detail} />
          <p>Shelling, 2nd Round</p>
          <AttackTable attacks={@state.result[3].detail} />
        </TabPane>
        <TabPane eventKey={4} tab="Night Combat">
          <p>Night Combat</p>
        </TabPane>
        <TabPane eventKey={5} tab="Misc">
          <p>Expedition Supporting Fire</p>
        </TabPane>
      </TabbedArea>
      </Grid>
    </div>

React.render <BattleDetailArea />, $('battle-detail-area')
