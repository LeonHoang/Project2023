import { ref, onMounted } from "vue"

type OptionValue = string | number

/** Data format required by Select */
interface SelectOption {
   value: OptionValue
   label: string
   disabled?: boolean
}

/** Interface response format */
interface ApiData {
   code:number
   data: SelectOption[]
   message: string
}

/** Input parameter format, for now you only need to pass the api function */
interface FetchSelectProps {
   api: () => Promise<ApiData>
}

export function useFetchSelect(props: FetchSelectProps) {
   const { api } = props

   const loading = ref<boolean>(false)
   const options = ref<SelectOption[]>([])
   const value = ref<OptionValue>("")

   /** Call the interface to obtain data */
   const loadData = () => {
     loading.value = true
     options.value = []
     api()
       .then((res) => {
         options.value = res.data
       })
       .finally(() => {
         loading.value = false
       })
   }

   onMounted(() => {
     loadData()
   })

   return {
     loading,
     options,
     value
   }
}