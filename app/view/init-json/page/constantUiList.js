const content = {
  pageType: "jh-page", pageId: "constantUiList", pageName: "Ui配置", version: 'v2',
  resourceList: [
    {
      actionId: "selectItemList",
      resourceType: "sql",
      desc: "✅查询列表-constantUiList",
      resourceData: { table: "web_constant_ui", operation: "select" }
    },
    {
      actionId: "insertItem",
      resourceType: "sql",
      desc: "✅添加-constantUiList",
      resourceData: { table: "web_constant_ui", operation: "jhInsert" }
    },
    {
      actionId: "updateItem",
      resourceType: "sql",
      desc: "✅更新-constantUiList",
      resourceData: { table: "web_constant_ui", operation: "jhUpdate" }
    },
    {
      actionId: "deleteItem",
      resourceType: "sql",
      desc: "✅删除-constantUiList",
      resourceData: { table: "web_constant_ui", operation: "jhDelete" }
    }
  ], // { actionId: '', resourceType: '', resourceData: {}, resourceHook: {}, desc: '' }
  headContent: [
    { tag: 'jh-page-title', value: "Ui配置", attrs: { cols: 12, sm: 6, md:4 }, helpBtn: true, slot: [] },
    { tag: 'v-spacer' },
    // { 
    //   tag: 'jh-search', 
    //   attrs: { cols: 12, sm: 6, md:8 },
    //   value: [
    //     { tag: "v-text-field", model: "serverSearchWhereLike.className", attrs: {prefix: '前缀'} },
    //   ], 
    //   searchBtn: true
    // }
  ],
  pageContent: [
    {
      tag: 'jh-table',
      attrs: {  },
      colAttrs: { clos: 12 },
      cardAttrs: { class: 'rounded-lg elevation-0' },
      headActionList: [
        { tag: 'v-btn', value: '新增', attrs: { color: 'success', class: 'mr-2', '@click': 'doUiAction("createItem")', small: true } },
        { tag: 'v-spacer' },
        // 默认筛选
        {
          tag: 'v-col',
          attrs: { cols: '12', sm: '6', md: '3', xs: 8, class: 'pa-0' },
          value: [
            { tag: 'v-text-field', attrs: {prefix: '筛选', 'v-model': 'searchInput', class: 'jh-v-input', ':dense': true, ':filled': true, ':single-line': true} },
          ],
        }
      ],
      headers: [
        { text: "ID", value: "id", width: 80 },
        { text: "constantKey", value: "constantKey", width: 120 },
        { text: "常量类型", value: "constantType", width: 120 },
        { text: "页面id", value: "pageId", width: 120 },
        { text: "描述", value: "desc", width: 120 },
        { text: "操作者", value: "operationByUser", width: 90 },
        { text: "操作时间", value: "operationAt", width: 150 },
        {text: '操作', value: 'action', align: 'center', sortable: false, width: 'window.innerWidth < 500 ? 80 : 120', class: 'fixed', cellClass: 'fixed'},

        // width 表达式需要使用字符串包裹
      ],
      value: [
        // vuetify table custom slot
      ],
      rowActionList: [
        { text: '编辑', icon: 'mdi-note-edit-outline', color: 'success', click: 'doUiAction("updateItem", item)' }, // 简写支持 pc 和 移动端折叠
        { text: '删除', icon: 'mdi-trash-can-outline', color: 'error', click: 'doUiAction("deleteItem", item)' } // 简写支持 pc 和 移动端折叠
      ],
    }
  ],
  actionContent: [
  ],
  includeList: [], // { type: < js | css | html | vueComponent >, path: ''}
  common: { 
    
    data: {
      constantObj: {},
      validationRules: {
        requireRules: [
          v => !!v || '必填',
        ],
      },
      serverSearchWhereLike: { className: '' }, // 服务端like查询
      serverSearchWhere: { }, // 服务端查询
      serverSearchWhereIn: { }, // 服务端 in 查询
      filterMap: {}, // 结果筛选条件
      constantTypeList: ['object', 'array'],
      language: '<$ ctx.app.config.language $>',
    },
    dataExpression: {
      isMobile: 'window.innerWidth < 500'
    }, // data 表达式
    watch: {},
    computed: {
      tableDataComputed() {
        if(this.filterMap) {
          return this.tableData.filter(row => {
            for (const key in this.filterMap) {
              if (this.filterMap[key] && row[key] !== this.filterMap[key]) {
                return false;
              }
            }
            return true;
          });
        } else {
          return this.tableData;
        }
      },
    },
    doUiAction: {
      /** case 'createItem':
            await this.redirectToCreate();
            break;
          case 'updateItem':
            await this.redirectToUpdate(uiActionData);
            break;
            */
      createItem: ['redirectToCreate'],
      updateItem: ['redirectToUpdate'],
    }, // 额外uiAction { [key]: [action1, action2]}
    methods: {
      async formatTableData() {
        let rows = _.cloneDeep(this.tableDataFromBackend); 
        for (const item of rows) {
          if (this.constantTypeList.includes(item.constantType)) {
            item[this.language] = JSON.parse(item[this.language]);
          }
          item.operationAt = dayjs(item.operationAt).format('YYYY-MM-DD HH:mm:ss'); 
        }
        this.tableData = rows;
      },
      // ---------- <<<<<<<<<<< 获取数据 uiAction  --------

      // ---------- 跳转编辑页面 uiAction >>>>>>>>>>>> --------
      async redirectToCreate() {
        window.location.href = `/${window.appInfo.appId}/page/constantUiEditor`
      },
      async redirectToUpdate(funObj) {
        window.location.href = `/${window.appInfo.appId}/page/constantUiEditor?id=${funObj.id}`
      },
      // ---------- <<<<<<<<<<< 跳转编辑页面 uiAction  --------
    }
  },
  
};

module.exports = content;
