package MapperTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yidu.hpc.dao.ClientMapper;
import com.yidu.hpc.domain.Client;

@ContextConfiguration(locations = { "classpath:spring/spring.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class MybatisTest {

	@Autowired
	private ClientMapper clientMapper;

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void addTest() {

		ClientMapper clientMapper = sqlSession.getMapper(ClientMapper.class);

//		for(int i=1;i<=2;i++) {
//			String uuid = UUID.randomUUID().toString().substring(0,5);
//			String uuidName = UUID.randomUUID().toString().substring(0,6);
//			String linkman = UUID.randomUUID().toString().substring(0,5);
//			String linkmanPhone = UUID.randomUUID().toString().substring(0,5);
//			String uuidPhone = UUID.randomUUID().toString().substring(0,11);
//			client.addClient(new Client(uuid, uuidName, uuidPhone, "长沙", linkman, linkmanPhone, "岳阳", 1, "请尽快送到", null, null));
//		}
//		
//		List<Client> findAllUserable = client.findAllUserable();
//		for (Client client2 : findAllUserable) {
//			System.out.println(client2);
//		}

//		Client findClientById = client.findClientById("1");
//		System.out.println(findClientById);

	/*	List<Client> findAllClient = client.findAllClient("李", "312321123");
		for (Client client2 : findAllClient) {
			System.out.println(client2);
		}

	}*/
	
		Client client = new Client();
		client.setClientName("黄鹏程");
		client.setClientPhone("11111111111");
		client.setAddress("北京");
		client.setClientId("1");
		int updateClietnById = clientMapper.updateClietnById(client);
		System.out.println(updateClietnById);
	}

}
