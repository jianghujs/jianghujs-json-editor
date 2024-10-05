const content = {
  pageType: "jh-page", pageId: "constantUiListSinglePage", pageName: "Ui配置-高级", version: 'v2',
  resourceList: [
    {
      actionId: "selectItemList",
      resourceType: "sql",
      desc: "✅查询列表",
      resourceData: { table: "web_constant_ui", operation: "select" }
    },
    {
      actionId: "insertItem",
      resourceType: "sql",
      desc: "✅添加",
      resourceData: { table: "web_constant_ui", operation: "jhInsert" }
    },
    {
      actionId: "updateItem",
      resourceType: "sql",
      desc: "✅更新",
      resourceData: { table: "web_constant_ui", operation: "jhUpdate" }
    },
    {
      actionId: "deleteItem",
      resourceType: "sql",
      desc: "✅删除",
      resourceData: { table: "web_constant_ui", operation: "jhDelete" }
    }
  ], // { actionId: '', resourceType: '', resourceData: {}, resourceHook: {}, desc: '' }
  headContent: [
    { tag: 'jh-page-title', value: "Ui配置-高级", attrs: { cols: 12, sm: 6, md:4 }, helpBtn: true, slot: [] },
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
        { tag: 'v-btn', value: '新增', attrs: { color: 'success', class: 'mr-2', '@click': 'doUiAction("startCreateItem")', small: true } },
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
        { text: '编辑', icon: 'mdi-note-edit-outline', color: 'success', click: 'doUiAction("startUpdateItem", item)' }, // 简写支持 pc 和 移动端折叠
        { text: '删除', icon: 'mdi-trash-can-outline', color: 'error', click: 'doUiAction("deleteItem", item)' } // 简写支持 pc 和 移动端折叠
      ],
    }
  ],
  actionContent: [
    {
      tag: 'jh-create-drawer',
      key: "create",
      attrs: {},
      title: '新增',
      headSlot: [
        { tag: 'v-spacer'}
      ],
      contentList: [
        { 
          label: "新增", 
          type: "form", 
          formItemList: [
            /**
             * colAtts: { cols: 12, md: 3 } // 表单父容器栅格设置
             * attrs: {} // 表单项属性
             */
            { label: "constantKey", model: "constantKey", tag: "v-text-field", rules: "validationRules.requireRules",   },
            { label: "常量类型", model: "constantType", tag: "v-select", rules: "validationRules.requireRules", attrs: {':items': 'constantObj.constantType'} },
            { label: "页面id", model: "pageId", tag: "v-text-field" },
            { label: "描述", model: "desc", tag: "v-text-field", },
            { label: "内容", tag: "div", colAttrs: { md: 12 }, value: `
              <vue-json-editor v-if="constantTypeList.includes(createItem.constantType)" v-model="createItem[language]" height="calc(100vh - 400px)"></vue-json-editor>
              <v-textarea v-else-if="createItem.constantType === 'html'" filled single-line label="常量内容" :rows="12" v-model="createItem[language]"
                  value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."></v-textarea>
              <v-text-field v-else class="jh-v-input" dense filled single-line label="常量内容"
                v-model="createItem['language']"></v-text-field>
            ` },

          ], 
          action: [{
            tag: "v-btn",
            value: "新增",
            attrs: {
              color: "success",
              ':small': true,
              '@click': "doUiAction('createItem')"
            }
          }],
        },

      ]
    },
    {
      tag: 'jh-update-drawer',
      key: "update",
      attrs: {},
      title: '编辑',
      headSlot: [
        { tag: 'v-spacer'}
      ],
      contentList: [
        { 
          label: "编辑", 
          type: "form", 
          formItemList: [
            /**
             * colAtts: { cols: 12, md: 3 } // 表单父容器栅格设置
             * attrs: {} // 表单项属性
             */
            { label: "constantKey", model: "constantKey", tag: "v-text-field", rules: "validationRules.requireRules",   },
            { label: "常量类型", model: "constantType", tag: "v-select", rules: "validationRules.requireRules", attrs: {':items': 'constantObj.constantType'} },
            { label: "页面id", model: "pageId", tag: "v-text-field" },
            { label: "描述", model: "desc", tag: "v-text-field", },
            { label: "内容", tag: "div", colAttrs: { md: 12 }, value: `
              <vue-json-editor v-if="constantTypeList.includes(updateItem.constantType)" v-model="updateItem[language]" height="calc(100vh - 400px)"></vue-json-editor>
              <v-textarea v-else-if="updateItem.constantType === 'html'" filled single-line label="常量内容" :rows="12" v-model="updateItem[language]"
                  value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."></v-textarea>
              <v-text-field v-else class="jh-v-input" dense filled single-line label="常量内容"
                v-model="updateItem['language']"></v-text-field>
            ` },
          ], 
          action: [{
            tag: "v-btn",
            value: "编辑",
            attrs: {
              color: "success",
              ':small': true,
              '@click': "doUiAction('updateItem')"
            }
          }],
        },
      ]
    },
  ],
  includeList: [
    { type: 'html', path: 'component/vueJsonEditor.html' },
  ], // { type: < js | css | html | vueComponent >, path: ''}
  common: { 
    
    data: {
      constantObj: {
        constantType: [
          {text: '对象', value: 'object'}, 
          {text: '数组', value: 'array'}, 
          {text: 'html', value: 'html'},
          {text: '文本', value: 'text'},
        ]
      },
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

      prepareDoCreateItem() {
        const { id, ...data } = this.createItem;
        if(this.constantTypeList.includes(this.createItem.constantType)){
          data[this.language] = JSON.stringify(this.createItem[this.language])
        }
        this.createActionData = data;
      },
      async prepareDoUpdateItem() {
        const { id, ...data } = this.updateItem;
        if(this.constantTypeList.includes(this.updateItem.constantType)){
          data[this.language] = JSON.stringify(this.updateItem[this.language])
        }
        this.updateItemId = id;
        this.updateActionData = data;
      },
    }
  },
  
};

module.exports = content;
