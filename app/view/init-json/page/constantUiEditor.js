const content = {
  pageType: "jh-page", pageId: "constantUiEditor", pageName: "Ui配置编辑", version: 'v2',
  resourceList: [
    {
      actionId: "getItemInfo",
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
  ], // { actionId: '', resourceType: '', resourceData: {}, resourceHook: {}, desc: '' }
  headContent: [
    { tag: 'jh-page-title', value: "Ui配置编辑", attrs: { cols: 12, sm: 6, md:4 }, helpBtn: true, slot: [
      /*html*/`
      <span role="button" class="success--text font-weight-regular jh-font-size-13 ml-1" @click="doUiAction('redirect')">
        <v-icon size="13" class="success--text">mdi-arrow-left-top-bold</v-icon>返回
      </span>
      `
    ] },
    { tag: 'v-spacer' },
    /*html*/`
    <v-btn @click="doUiAction('save') " color="success" depressed small>
      <v-icon class="mr-1" small>mdi-content-save-all</v-icon>
      保存
    </v-btn>
    `
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
      tag: 'v-col',
      attrs: { cols: 12, sm: 12, md: 12, class: 'pa-0' },
      value: `
      <v-card outlined class="rounded-lg jh-fixed-table-height pa-0">
        <!--表单-->
        <v-form ref="editForm" lazy-validation>
          <!--标题-->
          <v-row class="ma-0">
            <span class="text-subtitle-1 font-weight-medium px-4 pt-2">{{ editType }}信息</span>
          </v-row>
          <!--内容-->
          <v-row class="mt-0 px-4">
            <v-col cols="12" sm="12" md="4">
              <span class="jh-input-label">constantKey<span class="red--text text--accent-2 ml-1">*必填</span></span>
              <v-text-field class="jh-v-input" dense single-line filled label="constantKey"
                v-model="editItem.constantKey" :rules="validationRules.requireRules"></v-text-field>
            </v-col>
            <v-col cols="12" sm="12" md="4">
              <span class="jh-input-label">常量类型</span>
              <v-text-field class="jh-v-input" dense filled single-line label="常量类型"
                v-model="editItem['constantType']"></v-text-field>
            </v-col>
            <v-col cols="12" sm="12" md="4">
              <span class="jh-input-label">页面id</span>
              <v-text-field class="jh-v-input" dense filled single-line label="页面id"
                v-model="editItem['pageId']"></v-text-field>
            </v-col>
            <v-col cols="12" sm="12" md="4">
              <span class="jh-input-label">描述</span>
              <v-text-field class="jh-v-input" dense filled single-line label="描述"
                v-model="editItem['desc']"></v-text-field>
            </v-col>
            <v-col cols="12">
              <span class="jh-input-label">内容</span>
              <vue-json-editor v-if="constantTypeList.includes(editItem.constantType)" v-model="editItem[language]" height="calc(100vh - 400px)"
                  ></vue-json-editor>
              <v-textarea v-else-if="editItem.constantType === 'html'" filled single-line label="常量内容" :rows="12" v-model="editItem[language]"
                  value="The Woodman set to work at once, and so sharp was his axe that the tree was soon chopped nearly through."></v-textarea>
              <v-text-field v-else class="jh-v-input" dense filled single-line label="常量内容"
                v-model="editItem[language]"></v-text-field>
            </v-col>
          </v-row>
        </v-form>

        <!-- 遮罩层 -->
        <v-overlay :value="isFormLoading" absolute opacity="0.03">
          <v-progress-circular indeterminate size="64"></v-progress-circular>
        </v-overlay>
      </v-card>
    `
    }
  ],
  actionContent: [
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
      filterMap: {}, // 结果筛选条件
      constantTypeList: ['object', 'array'],
      language: '<$ ctx.app.config.language $>',

      // 操作相关
      editItem: {},
      editItemId: null,
      editType: null,
      saveActionData: {},
      isFormLoading: false,
    },
    dataExpression: {
      isMobile: 'window.innerWidth < 500'
    }, // data 表达式
    watch: {},
    async mounted() {
      await this.doUiAction('getUrlObj');
      await this.doUiAction('getItemData');
    },
    doUiAction: {
      /** case 'getUrlObj':
            await this.getUrlObj();
            break;
          case 'getItemData':
            await this.getItemData();
            await this.formatItemData();
            break;
          case 'save':
            await this.prepareSaveValidate();
            await this.confirmSaveItemDialog();
            await this.prepareDoSaveItem();
            await this.doSaveItem();
            await this.clearSave();
            break;
          case 'redirect':
            await this.redirectToConstantUiList();
            */
      getUrlObj: ['getUrlObj'],
      getItemData: ['getItemData', 'formatItemData'],
      save: ['prepareSaveValidate', 'confirmSaveItemDialog', 'prepareDoSaveItem', 'doSaveItem', 'clearSave'],
      redirect: ['redirectToConstantUiList'],
    }, // 额外uiAction { [key]: [action1, action2]}
    methods: {
      // ---------- 获取url参数 uiAction >>>>>>>>>> --------
      async getUrlObj() {
        const urlObj = new URLSearchParams(location.search.substring(1));
        const id = urlObj.get('id');
        if(id) {
          this.editItemId = id;
          this.editType = '修改';
        } else {
          this.editType = '新增';
        }
      },
      // ---------- <<<<<<<<<<< 获取url参数 uiAction  --------

      // ---------- 获取数据 uiAction >>>>>>>>>> --------
      async getItemData() {
        this.isFormLoading = true;
        const result = await window.jianghuAxios({
          data: {
            appData: {
              pageId: "constantUiEditor",
              actionId: "getItemInfo",
              where: {id: this.editItemId},
              actionData: {}
            }
          }
        });

        let rows = result.data.appData.resultData.rows; 
        if(rows.length > 0){
          this.editItem = rows[0];
          if(this.constantTypeList.includes(this.editItem.constantType)){
            this.editItem[this.language] = JSON.parse(this.editItem[this.language])
          } 
        }

        this.isFormLoading = false;
      },
      async formatItemData() {
        let row = _.cloneDeep(this.editItem); 
        if (this.constantTypeList.includes(row.constantType)) {
          row[this.language] = JSON.parse(row[this.language]);
        }
        this.editItem = row;
      },
      // ---------- <<<<<<<<<<< 获取数据 uiAction  --------

      // ---------- 保存数据 uiAction >>>>>>>>>> --------
      async prepareSaveValidate() {
        if (await this.$refs.editForm.validate()) {
          return true;
        }
        throw new Error("请完善表单信息")
      },
      async confirmSaveItemDialog() {
        if (await window.confirmDialog({ title: this.editType, content: `确定${this.editType}吗？` }) === false) {
          throw new Error("[confirmSaveItemDialog] 否");
        }
      },
      prepareDoSaveItem() {
        const { id, ...data } = this.editItem;
        if(this.constantTypeList.includes(this.editItem.constantType)){
          data[this.language] = JSON.stringify(data[this.language])
        }
        this.saveActionData = data;
      },
      async doSaveItem() {
       if(this.editItemId){
        await this.doUpdateItem();
       }else{
        await this.doCreateItem();
        await this.refreshPage();
        await this.getUrlObj();
       }
      },
      async doCreateItem() {
        await window.vtoast.loading("新增数据");
        const result = await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'constantUiEditor',
              actionId: 'insertItem',
              actionData: this.saveActionData
            }
          }
        })
        await window.vtoast.success("新增数据成功");

        this.editItemId = result.data.appData.resultData.rows[0];
      },
      async doUpdateItem() {
        await window.vtoast.loading("修改数据");
        await window.jianghuAxios({
          data: {
            appData: {
              pageId: 'constantUiEditor',
              actionId: 'updateItem',
              actionData: this.saveActionData,
              where: { id: this.editItemId }
            }
          }
        })
        await window.vtoast.success("修改数据成功");
      },
      async refreshPage() {
        const newUrl = `/${window.appInfo.appId}/page/constantUiEditor?id=${this.editItemId}`;
        history.pushState({}, null, newUrl);
      },
      async clearSave() {
        this.saveActionData = {};
      },
      // ---------- <<<<<<<<<<< 保存数据 uiAction  --------

      // ---------- Ui配置 uiAction >>>>>>>>>>>> --------
      async redirectToConstantUiList(funObj) {
        window.location.href = `/${window.appInfo.appId}/page/constantUiList`
      },
      // ---------- <<<<<<<<<<< Ui配置 uiAction  --------
    }
  },
  
};

module.exports = content;
